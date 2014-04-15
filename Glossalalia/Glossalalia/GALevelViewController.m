//
//  GALevelViewController.m
//  Glossolalia
//
//  This class presents the main game view. The game happens here!
//
//  Created by Rupert Deese on 2/17/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GALevelViewController.h"
#import "Constants.h"

@interface GALevelViewController ()
@property float fWidth, fHeight;
@end

@implementation GALevelViewController

// speed by which the command word is decreased
static double const SPEEDUP_ONECORRECT = .6;
static double const SLOWDOWN_NEWWORD = 1.5;
static double const COMMAND_TIME_LIMIT = 20.0;

// number of words needed to be pressed
// before movement speeds up
static int const NUM_WORDS_NEEDED_FOR_SPEEDUP = 1;

- (id)initWithMatch:(GKMatch*)match {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
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
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        // Grab the number of words pairs specified in numButtonsWordsPerPlayer
        // and initialize buttonWords
        _dataHandler = [GADataHandler new];
        _buttonWords = [_dataHandler grabRandomEntries:_numButtonWordsPerPlayer withPhrases:PHRASESONLY];
        
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
        _highScore = 5.0;
        
        // The initial amount of a time a word will take to scroll across
        // the screen. It will be changed as the level progresses
        _commandCompletionTimeLimit = COMMAND_TIME_LIMIT;
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        // instantiate progress bar
        _progressFrame = CGRectMake(0, 20, 0, 0.1*_fHeight);
        _progressBar = [[UIView alloc] initWithFrame:_progressFrame];
        //_progressBar.backgroundColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.4 alpha:0.4];
        [self.view addSubview:_progressBar];
        
//        _exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_exitButton.layer setCornerRadius:10.0];
//        [_exitButton.layer setBorderWidth:2.0];
//        [_exitButton.layer setBorderColor:[UIColor grayColor].CGColor];
//        [_exitButton setFrame:CGRectMake(0.04*_fWidth, 0.06*_fHeight, 0.20*_fWidth, 0.1*_fHeight)];
//        [_exitButton setTitle: @"Quit" forState:UIControlStateNormal];
//        [_exitButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:20.0]];
//        [_exitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        [_exitButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.3*_fWidth, 0*_fHeight, 0.4*_fWidth, 0.15*_fHeight)];
        [_scoreLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_scoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_scoreLabel setTextColor:[UIColor blackColor]];
        [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
        //[self.view addSubview:_scoreLabel];
        
        _commandLabelStartFrame = CGRectMake(-.5*_fWidth, 0.145*_fHeight, 0.5*_fWidth, 0.15*_fHeight);
        _commandLabelEndFrame = CGRectMake(1.5*_fWidth, 0.145
                                           *_fHeight, 0.5*_fWidth, 0.15*_fHeight);
        _commandLabel = [[UILabel alloc] initWithFrame:_commandLabelStartFrame];
        [_commandLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:40.0]];
        [_commandLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandLabel setTextColor:[UIColor blackColor]];
        [_commandLabel setAdjustsFontSizeToFitWidth:YES];
        [_commandLabel setText:_commandWord];
        [_commandLabel sizeToFit];
        [self.view addSubview:_commandLabel];
        
        _wordButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        float y = 0.29;
        
        // create GAElement Buttons
        for (GADataEntry* buttonWord in _buttonWords) {
            GAElement *wordButton = [[GAElement alloc] initRandomWithFrame:CGRectMake(0.0*_fWidth, y*_fHeight, 1*_fWidth, 0.15 * _fHeight) andWord:buttonWord];
            
            wordButton.delegate = self;
            [self.view addSubview:wordButton];
            [_wordButtons addObject:wordButton];
            
            y += 0.15;
        }
        
        float buffer = 0.02;
        y += buffer;
        
        _exitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_exitButton setFrame:CGRectMake(0, y*_fHeight, _fWidth*0.4, _fHeight*(1-y-buffer))];
        [_exitButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_exitButton setTitle: @"Quit" forState:UIControlStateNormal];
        [_exitButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_exitButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [_exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_exitButton setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        [_exitButton addTarget:self action:@selector(endMatch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitButton];
        
        
        _buttonColors = [[NSMutableArray alloc] initWithCapacity:0];
        for (GAElement *element in _wordButtons) {
            [_buttonColors addObject:element.backgroundColor];
        }
        
        [self doProgressBarColorAnimation];

        // wait for the phones to communicate for a second before the game begins. Should
        // flesh this out into a real wait screen ("Ready, set, go!")
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(getNewCommandWord) userInfo:nil repeats:NO];
    }
    
    return self;
}

- (void) doProgressBarColorAnimation {
    static NSInteger i = 0;
    
    if(i >= [_buttonColors count]) {
        i = 0;
    }
    
    float duration = 5*_highScore/pow(_score+1, 2);
    if (_score == _highScore) {
        duration = 5/_score;
    }
    [UIView animateWithDuration:duration animations:^{
        _progressBar.backgroundColor = [_buttonColors objectAtIndex:i];
    } completion:^(BOOL finished) {
        ++i;
        [self doProgressBarColorAnimation];
    }];
}

- (void) doProgressBarScoreChange:(BOOL) increase {
    if (increase) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect newFrame = _progressBar.frame;
            newFrame.size.height += _fHeight*0.03;
            newFrame.origin.y -= _fHeight*0.015;
            if (_score >= _highScore)
                newFrame.size.width = _fWidth;
            else
                newFrame.size.width = (_score / _highScore) * _fWidth;
            [_progressBar setFrame:newFrame];
            _progressBar.alpha = 0.5;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect newFrame = _progressBar.frame;
                newFrame.size.height -= _fHeight*0.03;
                newFrame.origin.y += _fHeight*0.015;
                [_progressBar setFrame:newFrame];
                _progressBar.alpha = 1;
            } completion:nil];
        }];
    }
    else {
        [UIView animateWithDuration:0.5 animations:^(void) {
            CGRect newFrame = _progressFrame;
            if (_score >= _highScore)
                newFrame.size.width = _fWidth;
            else
                newFrame.size.width = (_score / _highScore) * _fWidth;
            _progressBar.frame = newFrame;
        }];
    }
}

// Get a new command word, but we don't want it to be equal to the device's previous command
// because it might grab a word that is supposed to be swapped out, but whose message hasn't arrive
- (void) getNewCommandWordThatIsNot:(NSString *)remoteWord {
    NSString* newWord;

    if ([_legalCommandWords count] != 0 && arc4random_uniform(1000000) > 0) {
        newWord = [_legalCommandWords objectAtIndex:arc4random_uniform([_legalCommandWords count])];
        while ([newWord isEqualToString:remoteWord])
            newWord = [_legalCommandWords objectAtIndex:arc4random_uniform([_legalCommandWords count])];
    }
    else {
        newWord = [_commandsFromLocalButtons objectAtIndex:arc4random_uniform([_commandsFromLocalButtons count])];
        while ([newWord isEqualToString:remoteWord])
            newWord = [_commandsFromLocalButtons objectAtIndex:arc4random_uniform([_commandsFromLocalButtons count])];
    }
    
    _commandWord = newWord;
    [_commandLabel setText:_commandWord];
    [_commandLabel sizeToFit];
    [self startCommandCompletionTimer];
}

// get new command word, where we don't have to worry about grabbing a nonexistent command word
- (void) getNewCommandWord {
    NSString* newWord;
    if ([_legalCommandWords count] != 0 && arc4random_uniform(1000000) > 0)
        newWord = [_legalCommandWords objectAtIndex:arc4random_uniform([_legalCommandWords count])];
    else
        newWord = [_commandsFromLocalButtons objectAtIndex:arc4random_uniform([_commandsFromLocalButtons count])];

    _commandWord = newWord;
    [_commandLabel setText:_commandWord];
    [_commandLabel sizeToFit];
    [self startCommandCompletionTimer];
}

- (void) remotePlayerPressedButtonWithWord:(NSString*)remoteWord {
    
    NSLog(@"in remoteplayerpressed... with word: %@", remoteWord);
    
    // If we have no command word, this method should do nothing--we
    // don't want to penalize the player.
    if ([_commandWord isEqual:@""]) return;
    
    // query to see if we have this word displayed in the command bar
    // -- if it is, we increase the score and get a new word.
    if ([_commandWord isEqual:remoteWord]) {
        NSLog(@"A match with this command word");
        
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

        [self changeScoreBy:[NSNumber numberWithFloat:1.0]];
        
        _commandWord = @"";
        [self stopCommandCompletionTimer];
        [self getNewCommandWordThatIsNot:remoteWord];
    }
}


- (void) changeScoreBy:(NSNumber*)points {
    NSLog(@"Sending message to update score from changeScoreBy. Score change: %@", points);
    [self sendGameMessage:_GAScoreChangeMessage asDataWithWord:nil andPoints:points];
    [self locallyUpdateScoreBy:points];
}

// score update is performed here, as well as progress bar updating
- (void) locallyUpdateScoreBy:(NSNumber*)points {
    
    NSLog(@"Locally updating score by %@", points);
    _score += [points floatValue];
    
    
    // if we are updating the score because of a button
    // was correctly pressed
    if ([points floatValue] > 0) {
        ++_numWordsCorrect;
        [self checkForSpeedup];
    }
    // otherwise, reset the command completion time limit.
    else {
        _commandCompletionTimeLimit = COMMAND_TIME_LIMIT;
    }

    [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", (int)_score]];
    
// Commented out in order to implement continuous level
//    if (_score >= 50) {
//        [self endLevel];
//    }
    
    if (_score > _highScore) {
        _highScore = _score;
    }
    
    [self doProgressBarScoreChange:([points floatValue] > 0)];
}

- (void) stopCommandCompletionTimer {
    [_commandLabel.layer removeAllAnimations];
    [_commandLabel setFrame:_commandLabelStartFrame];
}

- (void) startCommandCompletionTimer {
    [self stopCommandCompletionTimer];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^(void){
        CGRect newFrame = _commandLabel.frame;
        newFrame.origin.x = 0;
        [_commandLabel setFrame:newFrame];
    }completion:^(BOOL finished){
        if (finished)
            [UIView animateWithDuration:_commandCompletionTimeLimit animations:^(void){
                CGRect newFrame = _commandLabel.frame;
                newFrame.origin.x = _fWidth-_commandLabel.frame.size.width;
                [_commandLabel setFrame:newFrame];
            } completion:^(BOOL finished){
                if (finished) {
                    [UIView animateWithDuration:0.5 animations:^(void){
                        [_commandLabel setFrame:_commandLabelEndFrame];
                    } completion:^(BOOL finished){
                        [self getNewCommandWord];
                    }];
                    [self commandTimedOut];
                }
            }];
    }];
    
}

// called when the command has timed out.
- (void) commandTimedOut {
    NSLog(@"Player failed to get this command in time!");
    _commandWord = @"";
    [self stopCommandCompletionTimer];
    [self changeScoreBy:[NSNumber numberWithFloat:(-1) * _score]];
}

// Checks if it's time for a speed boost
- (void) checkForSpeedup {
    if (_numWordsCorrect % NUM_WORDS_NEEDED_FOR_SPEEDUP == 0) {
        _commandCompletionTimeLimit = _commandCompletionTimeLimit - SPEEDUP_ONECORRECT;
        NSLog(@"Updating command bar time limit... time limit is now %f",
              _commandCompletionTimeLimit);
    }
    
}

// Encodes message data generated locally for transmission to other players.
- (void) sendGameMessage:(NSString*)message asDataWithWord:(NSString*)word andPoints:(NSNumber*) points {
    NSLog(@"In sendgamemessage");
    NSData *theMessage;
    
    // Encode our message for ease of transmission to other players.
    if ([message  isEqual: _GAButtonPressedMessage]) {
        NSLog(@"Sending buttonpressed message");
        theMessage = [[[NSString alloc] initWithFormat:@"%@;%@", _GAButtonPressedMessage, word] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: _GACommandListMessage]) {
        NSLog(@"Sending commandlist message");
        // if word is nil, that means this command is being used to initially populate
        // every other device's command word dictionaries
        if (word == nil) {

            NSString *stringOfCommands = [_commandsFromLocalButtons componentsJoinedByString:@","];
            theMessage =  [[[NSString alloc] initWithFormat:@"%@;%@", _GACommandListMessage, stringOfCommands] dataUsingEncoding:NSUTF8StringEncoding];
            
        // if word is not nil, then we know the message is being sent to update other devices
        // because a button has been swapped. The word variable is of the form
        // newWordToBeInserted;oldWordToBeDeleted
        } else {
            theMessage =  [[[NSString alloc] initWithFormat:@"%@;%@", _GACommandListMessage, word] dataUsingEncoding:NSUTF8StringEncoding];
        }
    }
    else if ([message  isEqual: _GAScoreChangeMessage]) {
        NSLog(@"Sending scorechange message");
        theMessage =  [[[NSString alloc] initWithFormat:@"%@;%@", _GAScoreChangeMessage, points] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message  isEqual: _GAEndMatchMessage]) {
        NSLog(@"Sending endmatch message");
        theMessage =  [[[NSString alloc] initWithFormat:@"%@", _GAEndMatchMessage] dataUsingEncoding:NSUTF8StringEncoding];
    }
    else if ([message isEqual: _GAConfirmCorrectButtonPressed]) {
        NSLog(@"Sending correctbutton message");
        theMessage = [[[NSString alloc] initWithFormat:@"%@;%@", _GAConfirmCorrectButtonPressed, word] dataUsingEncoding:NSUTF8StringEncoding];
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
    NSLog(@"In receivedatafrom...");
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray* components = [message componentsSeparatedByString:@";"];
    
    // message is a button press
    if ([components[0]  isEqual: _GAButtonPressedMessage]) {
        NSLog(@"Got buttonpressed message");
        // query to see if we have this word displayed in the command bar
        [self remotePlayerPressedButtonWithWord:components[1]];
    }
    
    // message is a list of command words sent from another device
    else if ([components[0]  isEqual: _GACommandListMessage]) {
        NSLog(@"Got command list message");
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
    else if ([components[0]  isEqual: _GAScoreChangeMessage]) {
        NSLog(@"Got scorechange message with score: %f", [components[1] floatValue]);
        // locally update the score
        [self locallyUpdateScoreBy:[[NSNumber alloc] initWithInteger:[components[1] floatValue]]];
    }
    
    // message is to signal the game is over
    else if ([components[0]  isEqual: _GAEndMatchMessage]) {
        NSLog(@"Got end match message");
        // match is over
        [self endMatch];
    }
    
    // message is to notify a player that they pressed the correct button,
    // in order to increment that GAElement's tap count. Only updates
    // if the receiving device contains a GAElement with the given word
    else if ([components[0] isEqual: _GAConfirmCorrectButtonPressed]) {
        NSLog(@"Got confirmcorrectbuttonmessage with word: %@", components[1]);
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

    NSLog(@"Updating element, now has %d taps", (int)elem.numTap);
    
    // if the number of taps for this button equals
    // the number needed to swap, create a new GAElement
    // and swap it with the existing one
    if ([elem numTap] >= [elem numToSwap]) {
        
        NSLog(@"Swapping element!");
        
        // apply the slowdown for a new word
        _commandCompletionTimeLimit += SLOWDOWN_NEWWORD;
        
        CGFloat buttonYLoc = elem.frame.origin.y;
        
        GADataEntry *newWord = [_dataHandler grabRandomEntryWithPhrases:PHRASESONLY];
        GAElement *newButton = [[GAElement alloc] initRandomWithFrame:CGRectMake(_fWidth, buttonYLoc, 1.0*_fWidth, 0.15 * _fHeight) andWord:newWord];
        newButton.delegate = self;
        
        NSString* newRemoteWord = [newWord remote];
        NSString* oldRemoteWord = [elem.word remote];
        NSLog(@"updating. remote: %@ local: %@", [newWord remote], [elem.word remote]);
        
        // update the commandWord dictionaries of the other devices
        NSString* theMessage = [[NSString alloc] initWithFormat:@"%@;%@", newRemoteWord, oldRemoteWord];
        [self sendGameMessage:_GACommandListMessage asDataWithWord:theMessage andPoints:nil];
        
        //update our button colors
        [_buttonColors removeObject:elem.backgroundColor];
        [_buttonColors addObject:newButton.backgroundColor];
        
        // out with the old, in with the new
        [_wordButtons removeObject:elem];
        [self.view addSubview:newButton];
        [_wordButtons addObject:newButton];
        
        // remove GAElement from local buttons, add new element to local buttons
        [_commandsFromLocalButtons removeObject:elem.word.remote];
        [_commandsFromLocalButtons addObject:newWord.remote];

        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
            CGRect newElemFrame = elem.frame;
            newElemFrame.origin.x = -_fWidth;
            [elem setFrame:newElemFrame];
            CGRect newNewFrame = newButton.frame;
            newNewFrame.origin.x = 0.0;
            [newButton setFrame:newNewFrame];
        }completion:^(BOOL finished){
            [elem removeFromSuperview];
        }];
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
    NSLog(@"in localplayerpressed... with word: %@ or %@", word.local, word.remote);
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

- (BOOL) prefersStatusBarHidden {
    return YES;
}


@end
