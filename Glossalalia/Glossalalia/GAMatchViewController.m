//
//  GAMatchViewController.m
//  Glossalalia
//
//  This class presents the main game view. The game happens here!
//
//  Created by Rupert Deese on 2/17/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAMatchViewController.h"

@interface GAMatchViewController ()
@property float fWidth, fHeight;
@end

@implementation GAMatchViewController

- (id)initWithMatch:(GKMatch*)match {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // capture the match
        _theMatch = match;
        _theMatch.delegate = self;
        
        _dataHandler = [GADataHandler new];
        
        // no command word yet
        _commandWord = nil;
        
        // get the word for our local button
        _buttonWord = [_dataHandler grabRandomEntry];
        
        _score = 0;
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
//        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.2*_fHeight)];
//        //[_gameStatus setBackgroundColor:[UIColor magentaColor]];
//        [_gameStatus setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
//        [_gameStatus setTextAlignment:NSTextAlignmentCenter];
//        [_gameStatus setTextColor:[UIColor blackColor]];
//        [self.view addSubview:_gameStatus];
//        
//        _gameButton = [[UIButton alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.6*_fHeight, 0.9*_fWidth, 0.2*_fHeight)];
//        [_gameButton setTitle:@"Push" forState:UIControlStateNormal];
//        [_gameButton setBackgroundColor:[UIColor purpleColor]];
//        _gameButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
//        [_gameButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_gameButton];
//        
//        _quitButton = [[UIButton alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.05*_fHeight, 0.9*_fWidth, 0.1*_fHeight)];
//        [_quitButton setTitle:@"Quit" forState:UIControlStateNormal];
//        [_quitButton setBackgroundColor:[UIColor grayColor]];
//        _quitButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
//        [_quitButton addTarget:self action:@selector(endMatch) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_quitButton];
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0*_fWidth, 0*_fHeight, _fWidth, 0.2*_fHeight)];
        [_scoreLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_scoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_scoreLabel setTextColor:[UIColor blackColor]];
        [_scoreLabel setText:[[NSString alloc] initWithFormat:@"%d", _score]];
        [self.view addSubview:_scoreLabel];
        
        _commandLabel = [[UILabel alloc] initWithFrame:CGRectMake(0*_fWidth, 0.2*_fHeight, _fWidth, 0.2*_fHeight)];
        [_commandLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_commandLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandLabel setTextColor:[UIColor magentaColor]];
        [_commandLabel setText:@"No command yet"];
        [self.view addSubview:_commandLabel];
        
        _wordButton = [[GAElement alloc] initSingleTapWithX:0 andY:0.6*_fHeight andWidth:_fWidth andHeight:0.2*_fHeight andLocal:[_buttonWord local] andRemote:[_buttonWord remote]];
        [_wordButton setBackgroundColor:[UIColor magentaColor]];
        [_wordButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [self.view addSubview:_wordButton];

    }
    
    return self;
}


// Sends a message to all players that a button corresponding to a given word has been pressed.
- (void) localPlayerPressedButtonWithWord:(GADataEntry*)word {
    NSData *dataToSend = [self gameMessage:@"button pressed" asDataWithWord:word];
    [_theMatch sendDataToAllPlayers:dataToSend withDataMode:GKMatchSendDataUnreliable error:nil];
}

- (void) remotePlayerPressedButtonWithWord:(GADataEntry*)word {
    // query to see if we have this word displayed in the command bar
}

- (void) receivedCommandRequestFromPlayer:(NSString*)playerID {
    // send the player a word in a send word message
}

// Encodes message data generated locally for transmission to other players.
- (NSData*) gameMessage:(NSString*)message asDataWithWord:(GADataEntry*)word {
    int messageCode = -1;
    NSString* wordToSend = nil;
    
    // Encode our message for ease of transmission to other players.
    if ([message  isEqual: @"button pressed"]) messageCode = 0;
    else if ([message  isEqual: @"send word"]) messageCode = 1;
    else if ([message  isEqual: @"need command"]) messageCode = 2;
    else if ([message  isEqual: @"increment score"]) messageCode = 3;
    else if ([message  isEqual: @"decrement score"]) messageCode = 4;
    else NSLog(@"Unrecognized message: %@", message);
    
    // The first two messages require accompanying words
    if (messageCode < 2) {
        if (word.englishLocal) wordToSend = word.spanish;
        else wordToSend = word.english;
        return [[[NSString alloc] initWithFormat:@"%d; %@", messageCode, wordToSend] dataUsingEncoding:NSUTF8StringEncoding];
    }
    // For the others, we just need a number.
    else return [[[NSString alloc] initWithFormat:@"%d", messageCode] dataUsingEncoding:NSUTF8StringEncoding];
}

- (void) decodeAndActOnMessageData:(NSData*)data {

}

- (void) sendMessage {
    [_theMatch sendDataToAllPlayers:[@"Push now!" dataUsingEncoding:NSUTF8StringEncoding] withDataMode:GKMatchSendDataUnreliable error:nil];
    //[_gameStatus setText:@"Wait!"];
}

- (void) endMatch {
    [_theMatch disconnect];
    [_delegate matchDidEnd];
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
    
    
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray* components = [message componentsSeparatedByString:@";"];
    
    if ([components[0]  isEqual: @"button pressed"]) {
        // query to see if we have this word displayed in the command bar
        [self remotePlayerPressedButtonWithWord:components[1]];
    }
    else if ([components[0]  isEqual: @"send word"]) {
        // put this word into our command bar
    }
    else if ([components[0]  isEqual: @"need command"]) {
        // send the player a word in a send word message
        [self receivedCommandRequestFromPlayer:playerID];
    }
    else if ([components[0]  isEqual: @"increment score"]) {
        // send out a message to increment the score
    }
    else if ([components[0]  isEqual: @"decrement score"]) {
        // send out a message to decrement the score
    }
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
