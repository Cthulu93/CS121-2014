//
//  GALevelViewController.m
//  Glossalalia
//
//  This class presents the main game view. The game happens here!
//
//  Created by Rupert Deese on 2/17/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GALevelViewController.h"

@interface GALevelViewController ()
@property float fWidth, fHeight;
@end

@implementation GALevelViewController

- (id)initWithMatch:(GKMatch*)match {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // capture the match
        _theMatch = match;
        _theMatch.delegate = self;
        
        _numButtonWordsPerPlayer = 4;
        
        _dataHandler = [GADataHandler new];
        _buttonWords = [_dataHandler grabRandomEntries:_numButtonWordsPerPlayer];
        
        // no command word yet
        _commandWord = @"No command yet.";
        
        _legalCommandWords = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSMutableArray *commandsFromLocalButtons = [[NSMutableArray alloc] initWithCapacity:0];
        for (GADataEntry *word in _buttonWords) {
            [commandsFromLocalButtons addObject:word.remote];
        }
        [self addLegalCommandWords:commandsFromLocalButtons];
        
        _score = 0;
        
        // The amount of time we give players to finish a command.
        _commandCompletionTimeLimit = 20;
        _commandCompletionTimeRemaining = _commandCompletionTimeLimit;
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        _exitButton = [[UIButton alloc] initWithFrame:CGRectMake(0*_fWidth, 0*_fHeight, 0.3*_fWidth, 0.15*_fHeight)];
        [_exitButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_exitButton setBackgroundColor:[UIColor grayColor]];
        [_exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_exitButton setTitle: @"Quit" forState:UIControlStateNormal];
        [_exitButton addTarget:self action:@selector(endMatch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitButton];
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.3*_fWidth, 0*_fHeight, 0.4*_fWidth, 0.15*_fHeight)];
        [_scoreLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_scoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_scoreLabel setTextColor:[UIColor blackColor]];
        [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
        [self.view addSubview:_scoreLabel];
        
        _commandTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.7*_fWidth, 0*_fHeight, 0.3*_fWidth, 0.15*_fHeight)];
        [_commandTimeLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_commandTimeLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandTimeLabel setTextColor:[UIColor magentaColor]];
        [_commandTimeLabel setText:[[NSString alloc] initWithFormat:@"%d", _commandCompletionTimeRemaining]];
        [self.view addSubview:_commandTimeLabel];
        
        _commandLabel = [[UILabel alloc] initWithFrame:CGRectMake(0*_fWidth, 0.15*_fHeight, 1*_fWidth, 0.15*_fHeight)];
        [_commandLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_commandLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandLabel setTextColor:[UIColor purpleColor]];
        [_commandLabel setText:_commandWord];
        [self.view addSubview:_commandLabel];
        
        _wordButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        float y = 0.4;
        for (GADataEntry* buttonWord in _buttonWords) {
            GAElement *wordButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0,y*_fHeight, _fWidth, y*_fHeight) andWord:buttonWord];
                                     
            [wordButton setBackgroundColor:[UIColor magentaColor]];
            [wordButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
            wordButton.delegate = self;
            [self.view addSubview:wordButton];
            [_wordButtons addObject:wordButton];
            
            y += 0.15;
        }

        [self announceButtonWordsToAllPlayers];
        [self getNewCommandWord];
    }
    
    return self;
}

- (void) getNewCommandWord {
    _commandWord = [_legalCommandWords objectAtIndex:arc4random_uniform([_legalCommandWords count])];
    [_commandLabel setText:_commandWord];
    NSLog(@"Recived command word %@", _commandWord);
    [self startCommandCompletionTimer];
}

- (void) addLegalCommandWords:(NSArray*)newWords {
    [_legalCommandWords addObjectsFromArray:newWords];
}

- (void) announceButtonWordsToAllPlayers {
    NSData *buttonWordData = [self gameMessage:@"send command list" asDataWithWord:nil andPoints:nil];
    [_theMatch sendDataToAllPlayers:buttonWordData withDataMode:GKMatchSendDataReliable error:nil];
}

//- (void) askRandomPlayerForNewCommandWord {
//    NSLog(@"Asking a random player for a new command word.");
//    NSString *playerID = [[_theMatch playerIDs] objectAtIndex:arc4random_uniform([[_theMatch playerIDs] count])];
//    NSData *dataToSend = [self gameMessage:@"need command" asDataWithWord:nil andPoints:nil];
//    [_theMatch sendData:dataToSend toPlayers:[[NSArray alloc] initWithObjects:playerID, nil] withDataMode:GKMatchSendDataUnreliable error:nil];
//
//    //if (!_commandRequestTimer) _commandRequestTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(askRandomPlayerForNewCommandWord) userInfo:nil repeats:YES];
//}

- (void) remotePlayerPressedButtonWithWord:(NSString*)remoteWord {
    NSLog(@"Remote player pressed button with word: %@", remoteWord);
    
    // If we have no command word, this method should do nothing--we
    // don't want to penalize the player.
    if ([_commandWord isEqual:@""]) return;
    
    // query to see if we have this word displayed in the command bar
    // -- if it is, we increase the score and get a new word.
    if ([_commandWord isEqual:remoteWord]) {
        NSLog(@"Got the right word! %@ and %@", _commandWord, remoteWord);
        
        [self changeScoreBy:[NSNumber numberWithInt:10]];
        [_commandLabel setText:@"Success!"];
        _commandWord = @"";
        [self stopCommandCompletionTimer];
        [self getNewCommandWord];
        
        NSData *scoreData = [self gameMessage:@"change score" asDataWithWord:nil andPoints:[NSNumber numberWithInt:10]];
        [_theMatch sendDataToAllPlayers:scoreData withDataMode:GKMatchSendDataReliable error:nil];
    }
    else {
        // RD: I don't think it makes sense to decrement the score when a guess is incorrect.
        // That would make people less likely to freak out and mash buttons, which is something
        // that makes spaceteam fun.
//        [self changeScoreBy:[NSNumber numberWithInt:-10]];
//        scoreData = [self gameMessage:@"change score" asDataWithWord:nil andPoints:[NSNumber numberWithInt:-10]];
        NSLog(@"Not the right word! \"%@\" and \"%@\"", _commandWord, remoteWord);
    }
}

//- (void) receivedCommandListRequestFromPlayer:(NSString*)playerID {
//    // Choose a random word from those on the player's buttons.
//    GADataEntry *word = [_buttonWords objectAtIndex:arc4random_uniform([_buttonWords count])];
//    NSLog(@"received command request from other player! Sending word %@", word.remote);
//    // send the player a word in a send word message
//    NSData *dataToSend = [self gameMessage:@"send word" asDataWithWord:word.remote andPoints:nil];
//    [_theMatch sendData:dataToSend toPlayers:[[NSArray alloc] initWithObjects:playerID, nil] withDataMode:GKMatchSendDataUnreliable error:nil];
//}

//- (void) receivedCommandWord:(NSString*)remoteWord {
//    _commandWord = remoteWord;
//    [_commandLabel setText:_commandWord];
//    NSLog(@"Recived command word %@", _commandWord);
//    [self stopCommandRequestTimer];
//    [self stopCommandCompletionTimer];
//    _commandCompletionTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(decrementAndCheckCommandTimeLimit) userInfo:nil repeats:YES];
//}

- (void) changeScoreBy:(NSNumber*)points {
    NSLog(@"Changing the score by %@ points", points);
    _score += [points integerValue];
    [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
    if (_score >= 50) {
        [self endLevel];
    }
}

- (void) stopCommandCompletionTimer {
    if (_commandCompletionTimer) {
        [_commandCompletionTimer invalidate];
        _commandCompletionTimer = nil;
    }
    _commandCompletionTimeRemaining = _commandCompletionTimeLimit;
    [_commandTimeLabel setText:[[NSString alloc] initWithFormat:@"%d", _commandCompletionTimeRemaining]];
}

- (void) startCommandCompletionTimer {
    [self stopCommandCompletionTimer];
    _commandCompletionTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(decrementAndCheckCommandTimeLimit) userInfo:nil repeats:YES];
}

- (void) decrementAndCheckCommandTimeLimit {
    _commandCompletionTimeRemaining -= 1;
    [_commandTimeLabel setText:[[NSString alloc] initWithFormat:@"%d", _commandCompletionTimeRemaining]];
    if (_commandCompletionTimeRemaining <= 0) [self commandTimedOut];
}

- (void) commandTimedOut {
    [_commandLabel setText:@"Spacerats!"];
    _commandWord = @"";
    
    [self stopCommandCompletionTimer];
    
    [self getNewCommandWord];
    NSLog(@"Player failed to get this command in time!");
    
    [self changeScoreBy:[NSNumber numberWithInt:-10]];
    NSData *scoreData = [self gameMessage:@"change score" asDataWithWord:nil andPoints:[NSNumber numberWithInt:-10]];
    [_theMatch sendDataToAllPlayers:scoreData withDataMode:GKMatchSendDataReliable error:nil];
}

// Encodes message data generated locally for transmission to other players.
- (NSData*) gameMessage:(NSString*)message asDataWithWord:(NSString*)remoteWord andPoints:(NSNumber*) points {
    NSLog(@"Encoding a game message for: %@", message);
    int messageCode = -1;
    
    // Encode our message for ease of transmission to other players.
    if ([message  isEqual: @"button pressed"]) {
        messageCode = 0;
        return [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, remoteWord] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: @"send command list"]) {
        messageCode = 1;
        NSMutableArray *commandList = [[NSMutableArray alloc] initWithCapacity:0];
        for (GADataEntry *word in _buttonWords) {
            [commandList addObject:word.remote];
        }
        NSString *stringOfCommands = [commandList componentsJoinedByString:@","];
        return [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, stringOfCommands] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: @"change score"]) {
        messageCode = 2;
        return [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, points] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: @"end match"]) {
        messageCode = 3;
        return [[[NSString alloc] initWithFormat:@"%d", messageCode] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else {
        NSLog(@"Unrecognized message: %@", message);
        return nil;
    }
}

- (void) endLevel {
    [self stopCommandCompletionTimer];
//    [self stopCommandRequestTimer];
    [self.delegate levelDidEnd];
}

- (void) endMatch {
    NSData *endMatchMessage = [self gameMessage:@"end match" asDataWithWord:nil andPoints:nil];
    [_theMatch sendDataToAllPlayers:endMatchMessage withDataMode:GKMatchSendDataReliable error:nil];
    [self stopCommandCompletionTimer];
//    [self stopCommandRequestTimer];
    [_theMatch disconnect];
    [_delegate matchDidEnd];
}

#pragma mark GAElementDelegate methods

- (void) localPlayerPressedButtonForWord:(GADataEntry *)word {
    NSLog(@"Sending data with remote word %@ to all players", word.remote);
    NSData *dataToSend = [self gameMessage:@"button pressed" asDataWithWord:word.remote andPoints:nil];
    [_theMatch sendDataToAllPlayers:dataToSend withDataMode:GKMatchSendDataUnreliable error:nil];
    
    // to account for the fact that we may have had a command from our own list.
    [self remotePlayerPressedButtonWithWord:word.remote];
}

#pragma mark UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // We want this view to go away regardless, cause the match is over.
    [_delegate matchDidEnd];
}

#pragma mark GKMatchDelegate methods

- (void) match:(GKMatch *)match didFailWithError:(NSError *)error {
    NSLog(@"%lu recovery options", (unsigned long)[[error localizedRecoveryOptions] count]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedRecoverySuggestion] delegate:self cancelButtonTitle:[error localizedRecoveryOptions][0] otherButtonTitles:[error localizedRecoveryOptions][1], nil];
    [alert show];
}

- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    //[_gameStatus setText:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    
    NSLog(@"Got data from player!");
    
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray* components = [message componentsSeparatedByString:@";"];
    
    if ([components[0]  isEqual: @"0"]) {
        // query to see if we have this word displayed in the command bar
        [self remotePlayerPressedButtonWithWord:components[1]];
    }
    else if ([components[0]  isEqual: @"1"]) {
        // put the received command words into our list.
        [self addLegalCommandWords:[components[1] componentsSeparatedByString:@","]];
    }
    else if ([components[0]  isEqual: @"2"]) {
        // send out a message to increment the score
        [self changeScoreBy:[[NSNumber alloc] initWithInt:[components[1] integerValue]]];
    }
    else if ([components[0]  isEqual: @"3"]) {
        // match is over
        [self endMatch];
    }
    else NSLog(@"Received unrecognized message code: %@", components[0]);
}


// called when a player disconnects or reconnects
- (void) match:(GKMatch *)match player:(NSString *)playerID didChangeState:(GKPlayerConnectionState)state {
    if (state == GKPlayerStateConnected) {
        NSLog(@"%@ connected.", playerID);
    } else if (state == GKPlayerStateDisconnected) {
        NSLog(@"%@ disconnected.", playerID);
        [_delegate matchDidEnd];
    }
    else {
        NSLog(@"%@'s status is unknown.", playerID);
    }
}

// Only called when someone disconnects in a two-player match.
- (BOOL)match:(GKMatch *)match shouldReinvitePlayer:(NSString *)playerID {
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
