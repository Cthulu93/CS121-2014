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
        _rouSession = [ROUSession new];
        _rouSession.delegate = self;
        
        _GAButtonPressedMessage = @"button pressed";
        _GAConfirmCorrectButtonPressed = @"correct button";
        _GACommandListMessage = @"send command list";
        _GAScoreChangeMessage = @"change score";
        _GAEndMatchMessage = @"end match";
        
        _numButtonWordsPerPlayer = 4;
        
        // Grab the number of words pairs specified in numButtonsWordsPerPlayer
        // and initialize buttonWords
        _dataHandler = [GADataHandler new];
        _buttonWords = [_dataHandler grabRandomEntries:_numButtonWordsPerPlayer];
        
        // no command word yet
        _commandWord = @"No command yet.";
        
        _legalCommandWords = [[NSMutableArray alloc] initWithCapacity:0];
        
        // Set command words for other devices, based on what
        // this device's local words are
        _commandsFromLocalButtons = [[NSMutableArray alloc] initWithCapacity:0];
        for (GADataEntry *word in _buttonWords) {
            [_commandsFromLocalButtons addObject:word.remote];
        }
        
        // Send words out to all the other devices
        [self sendGameMessage:_GACommandListMessage asDataWithWord:nil andPoints:nil];
        _score = 0;
        
        // Let high score begin at 5
        _highScore = 5;
        
        // number of words needed to be pressed
        // before movement speeds up
        _numWordsNeededToSpeedUp = 4;
        
        // The initial amount of a time a word will take to scroll across
        // the screen. It will be changed as the level progresses
        _commandCompletionTimeLimit = 20.0;
        _commandCompletionTimeRemaining = _commandCompletionTimeLimit;
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        // instantiate progress bar
        _progressFrame = CGRectMake(0, 0, 0, _fHeight);
        _progressBar = [[UIView alloc] initWithFrame:_progressFrame];
        _progressBar.backgroundColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.4 alpha:0.4];
        [self.view addSubview:_progressBar];
        
        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_exitButton.layer setCornerRadius:10.0];
        [_exitButton.layer setBorderWidth:2.0];
        [_exitButton.layer setBorderColor:[UIColor grayColor].CGColor];
        [_exitButton setFrame:CGRectMake(0.04*_fWidth, 0.06*_fHeight, 0.20*_fWidth, 0.1*_fHeight)];
        [_exitButton setTitle: @"Quit" forState:UIControlStateNormal];
        [_exitButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:20.0]];
        [_exitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_exitButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_exitButton addTarget:self action:@selector(endMatch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitButton];
        
        
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.3*_fWidth, 0*_fHeight, 0.4*_fWidth, 0.15*_fHeight)];
        [_scoreLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_scoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_scoreLabel setTextColor:[UIColor blackColor]];
        [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
        [self.view addSubview:_scoreLabel];
        
        _commandLabelStartFrame = CGRectMake(-.4*_fWidth, 0.15*_fHeight, 0.4*_fWidth, 0.15*_fHeight);
        _commandLabelEndFrame = CGRectMake(1.4*_fWidth, 0.15*_fHeight, 0.4*_fWidth, 0.15*_fHeight);
        _commandLabel = [[UILabel alloc] initWithFrame:_commandLabelStartFrame];
        [_commandLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:35.0]];
        [_commandLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandLabel setTextColor:[UIColor magentaColor]];
        [_commandLabel setAdjustsFontSizeToFitWidth:YES];
        [_commandLabel setText:_commandWord];
        [self.view addSubview:_commandLabel];
        
        _wordButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        float y = 0.32;
        
        // create GAElement Buttons
        for (GADataEntry* buttonWord in _buttonWords) {
            GAElement *wordButton = [[GAElement alloc] initRandomWithFrame:CGRectMake(0.05*_fWidth, y*_fHeight, 0.9*_fWidth, 0.15 * _fHeight) andWord:buttonWord];
            
            wordButton.delegate = self;
            [self.view addSubview:wordButton];
            [_wordButtons addObject:wordButton];
            
            y += 0.17;
        }

        // wait for the phones to communicate for a second before the game begins. Should
        // flesh this out into a real wait screen ("Ready, set, go!")
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(getNewCommandWord) userInfo:nil repeats:NO];
    }
    
    return self;
}

- (void) getNewCommandWord {
    if ([_legalCommandWords count] != 0 && arc4random_uniform(1000000) > 0) {
        _commandWord = [_legalCommandWords objectAtIndex:arc4random_uniform([_legalCommandWords count])];
    }
    else
        _commandWord = [_commandsFromLocalButtons objectAtIndex:arc4random_uniform([_commandsFromLocalButtons count])];
    [_commandLabel setText:_commandWord];
    [self startCommandCompletionTimer];
}



- (void) remotePlayerPressedButtonWithWord:(NSString*)remoteWord {
    
    // If we have no command word, this method should do nothing--we
    // don't want to penalize the player.
    if ([_commandWord isEqual:@""]) return;
    
    // query to see if we have this word displayed in the command bar
    // -- if it is, we increase the score and get a new word.
    if ([_commandWord isEqual:remoteWord]) {
        
        // We need this loop to check if a device tapped its own
        // button in response to a command on its own screen, in which
        // case we go directly to updating its words. If another device
        // tapped it button in response to a command not from its own
        // screen, then we sendGameMessage
        for (GAElement* elem in _wordButtons) {
            
            if ([[elem.word remote] isEqualToString:remoteWord]) {
                [self updateGAElementWithWord:elem];
                break;
            }
        }
        
        [self sendGameMessage:_GAConfirmCorrectButtonPressed asDataWithWord:remoteWord andPoints:nil];

        [self changeScoreBy:[NSNumber numberWithInt:10]];
        
        [_commandLabel setText:@"Success!"];
        _commandWord = @"";
        [self stopCommandCompletionTimer];
        [self getNewCommandWord];
    }
}


- (void) changeScoreBy:(NSNumber*)points {
    [self sendGameMessage:_GAScoreChangeMessage asDataWithWord:nil andPoints:points];
    [self locallyUpdateScoreBy:points];
}

// score update is performed here, as well as progress bar updating
- (void) locallyUpdateScoreBy:(NSNumber*)points {
    _score += [points integerValue];
    
    
    // if we are updating the score because of a button
    // was correctly pressed
    if ([points intValue] > 0) {
        ++_numWordsCorrect;
        
        if (_numWordsCorrect % _numWordsNeededToSpeedUp == 0) {
            // increase speed by 200%
            _commandCompletionTimeLimit = _commandCompletionTimeLimit * 2;
            NSLog(@"Updating command bar time limit... time limit is now %f",
                  _commandCompletionTimeLimit);
        }
    }
    [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
    
// Commented out in order to implement continuous level
//    if (_score >= 50) {
//        [self endLevel];
//    }
    
    //progress bar update
    [UIView animateWithDuration:0.5 animations:^(void) {
        _progressBar.frame = CGRectMake(0, 0, _score * _fWidth/50, _fHeight);
    }];
}

- (void) stopCommandCompletionTimer {
    [self.view.layer removeAllAnimations];
    [_commandLabel setFrame:_commandLabelStartFrame];
}

- (void) startCommandCompletionTimer {
    [self stopCommandCompletionTimer];
    
    [UIView animateWithDuration:_commandCompletionTimeLimit animations:^(void){
        [_commandLabel setFrame:_commandLabelEndFrame];
    } completion:^(BOOL finished){
        if (finished) {
            [self commandTimedOut];
        }
    }];
}

- (void) commandTimedOut {
    NSLog(@"Player failed to get this command in time!");
    [_commandLabel setText:@"Spacerats!"];
    _commandWord = @"";
    
    [self stopCommandCompletionTimer];
    
    [self getNewCommandWord];
    
    [self changeScoreBy:[NSNumber numberWithInt:-10]];
}

// Encodes message data generated locally for transmission to other players.
- (void) sendGameMessage:(NSString*)message asDataWithWord:(NSString*)word andPoints:(NSNumber*) points {
    NSData *theMessage;
    int messageCode = -1;
    
    // Encode our message for ease of transmission to other players.
    if ([message  isEqual: _GAButtonPressedMessage]) {
        messageCode = 0;
        theMessage = [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, word] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: _GACommandListMessage]) {
        
        messageCode = 1;
        // if word is nil, that means this command is being used to initially populate
        // every other device's command word dictionaries
        if (word == nil) {

            NSString *stringOfCommands = [_commandsFromLocalButtons componentsJoinedByString:@","];
            theMessage =  [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, stringOfCommands] dataUsingEncoding:NSUTF8StringEncoding];
            
        // if word is not nil, then we know the message is being sent to update other devices
        // because a button has been swapped. The word variable is of the form
        // newWordToBeInserted;oldWordToBeDeleted
        } else {
            theMessage =  [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, word] dataUsingEncoding:NSUTF8StringEncoding];
        }
    }
    else if ([message  isEqual: _GAScoreChangeMessage]) {
        messageCode = 2;
        theMessage =  [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, points] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: _GAEndMatchMessage]) {
        messageCode = 3;
        theMessage =  [[[NSString alloc] initWithFormat:@"%d", messageCode] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message isEqual: _GAConfirmCorrectButtonPressed]) {
        messageCode = 4;
        theMessage = [[[NSString alloc] initWithFormat:@"%d;%@", messageCode, word] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else {
        NSLog(@"Unrecognized message: %@", message);
        theMessage =  nil;
    }
    if (theMessage != nil) {
        [_rouSession sendData:theMessage];
    }
}


- (void) endMatch {
    [self sendGameMessage:_GAEndMatchMessage asDataWithWord:nil andPoints:nil];
    [self stopCommandCompletionTimer];
    [_theMatch disconnect];
    [_delegate matchDidEnd];
}

- (void) receiveDataFromPlayer:(NSData*)data {
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray* components = [message componentsSeparatedByString:@";"];
    
    // message is a button press
    if ([components[0]  isEqual: @"0"]) {
        // query to see if we have this word displayed in the command bar
        [self remotePlayerPressedButtonWithWord:components[1]];
    }
    
    // message is a list of command words sent from another device
    else if ([components[0]  isEqual: @"1"]) {
        
        // if only two strings in the components, then the
        // second string contains the initial words to populate
        // the command word dict with
        if ([components count] == 2) {
            // put the received command words into our list.
            [_legalCommandWords addObjectsFromArray:[components[1] componentsSeparatedByString:@","]];
        } else if ([components count] == 3){
        
            // the second string is newWordToBeInserted, and
            // the third string is oldWordToBeDeleted
            NSString* newWordToBeInserted = components[1];
            NSString* oldWordToBeDeleted = components[2];
            NSLog(@"new Word message received. newWord: %@ and oldWord: %@", newWordToBeInserted, oldWordToBeDeleted);
            [self exchangeWordsWithNewWord:newWordToBeInserted andOldWord:oldWordToBeDeleted];
        }
    }
    
    // message is to change the score
    else if ([components[0]  isEqual: @"2"]) {
        // send out a message to increment the score
        [self locallyUpdateScoreBy:[[NSNumber alloc] initWithInteger:[components[1] integerValue]]];
    }
    
    // message is to signal the game is over
    else if ([components[0]  isEqual: @"3"]) {
        // match is over
        [self endMatch];
    }
    
    // message is to notify a player that they pressed the correct button,
    // in order to increment that GAElement's tap count. Only updates
    // if the receiving device contains a GAElement with the given word
    else if ([components[0] isEqual: @"4"]) {
        
        for (GAElement* elem in _wordButtons) {
            
            if ([[elem.word remote] isEqualToString:components[1]]) {
                [self updateGAElementWithWord:elem];
                break;
            }
        }
    }
    else NSLog(@"Received unrecognized message code: %@", components[0]);
}

// Increments the number of times the button has been
// tapped by 1, and if this is equal to the total number
// of taps that button needs to be swapped out, it performs
// the swap
- (void) updateGAElementWithWord:(GAElement *)elem {
    
    // increment the number of times that GAElement
    // has been correctly tapped
    elem.numTap += 1;

    
    // if the number of taps for this button equals
    // the number needed to swap, create a new GAElement
    // and swap it with the existing one
    if ([elem numTap] == [elem numToSwap]) {
        
        CGFloat buttonYLoc = elem.frame.origin.y;
        
        GADataEntry *newWord = [_dataHandler grabRandomEntry];
        GAElement *newButton = [[GAElement alloc] initRandomWithFrame:CGRectMake(0.05*_fWidth, buttonYLoc, 0.9*_fWidth, 0.15 * _fHeight) andWord:newWord];
        newButton.delegate = self;
        
        NSString* newRemoteWord = [newWord remote];
        NSString* oldRemoteWord = [elem.word remote];
        NSLog(@"updating. remote: %@ local: %@", [newWord remote], [elem.word remote]);
        
        // update the commandWord dictionaries of the other devices
        NSString* theMessage = [[NSString alloc] initWithFormat:@"%@;%@", newRemoteWord, oldRemoteWord];
        [self sendGameMessage:_GACommandListMessage asDataWithWord:theMessage andPoints:nil];
        
        // out with the old, in with the new
        [elem removeFromSuperview];
        [_wordButtons removeObject:elem];
        [self.view addSubview:newButton];
        [_wordButtons addObject:newButton];
    }
}

- (void) exchangeWordsWithNewWord:(NSString*)newWord andOldWord:(NSString*)oldWord {
    [_legalCommandWords removeObject:oldWord];
    [_legalCommandWords addObject:newWord];
    
}

#pragma mark ROUSessionDelegate methods

-(void)session:(ROUSession *)session preparedDataForSending:(NSData *)data{
    NSError *theError;
    [_theMatch sendDataToAllPlayers:data
                       withDataMode:GKMatchSendDataUnreliable // we can use unreliable mode now
                              error:&theError];
    if (theError != nil)
        NSLog(@"Error was: %@", [theError localizedDescription]);
}

-(void)session:(ROUSession *)session receivedData:(NSData *)data{
    [self receiveDataFromPlayer:data];
}

#pragma mark GAElementDelegate methods

- (void) localPlayerPressedButtonForWord:(GADataEntry *)word {
    //NSLog(@"Sending data with remote word %@ to all players", word.remote);
    [self sendGameMessage:_GAButtonPressedMessage asDataWithWord:word.remote andPoints:nil];
    
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedRecoverySuggestion] delegate:self cancelButtonTitle:[error localizedRecoveryOptions][0] otherButtonTitles:[error localizedRecoveryOptions][1], nil];
    [alert show];
}

- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    [_rouSession receiveData:data];
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
