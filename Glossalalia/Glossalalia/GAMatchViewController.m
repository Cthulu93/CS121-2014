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
        _theMatch = match;
        _theMatch.delegate = self;
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.2*_fHeight)];
        //[_gameStatus setBackgroundColor:[UIColor magentaColor]];
        [_gameStatus setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_gameStatus setTextAlignment:NSTextAlignmentCenter];
        [_gameStatus setTextColor:[UIColor blackColor]];
        [self.view addSubview:_gameStatus];
        
        _gameButton = [[UIButton alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.6*_fHeight, 0.9*_fWidth, 0.2*_fHeight)];
        [_gameButton setTitle:@"Push" forState:UIControlStateNormal];
        [_gameButton setBackgroundColor:[UIColor purpleColor]];
        _gameButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
        [_gameButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_gameButton];
        
        _quitButton = [[UIButton alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.05*_fHeight, 0.9*_fWidth, 0.1*_fHeight)];
        [_quitButton setTitle:@"Quit" forState:UIControlStateNormal];
        [_quitButton setBackgroundColor:[UIColor grayColor]];
        _quitButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:30.0];
        [_quitButton addTarget:self action:@selector(endMatch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_quitButton];

    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) sendMessage {
    [_theMatch sendDataToAllPlayers:[@"Push now!" dataUsingEncoding:NSUTF8StringEncoding] withDataMode:GKMatchSendDataUnreliable error:nil];
    [_gameStatus setText:@"Wait!"];
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
    [_gameStatus setText:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
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
