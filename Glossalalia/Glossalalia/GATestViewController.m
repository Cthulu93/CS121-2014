//
//  GATestViewController.m
//  Glossalalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GATestViewController.h"

@interface GATestViewController ()
@property float fWidth, fHeight;
@end

@implementation GATestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        _matchmakeButton = [[UIButton alloc] initWithFrame: CGRectMake(0.05*_fWidth, 0.05*_fHeight, 0.9*_fWidth, 0.1*_fHeight)];
        [_matchmakeButton setTitle: @"Request a match" forState:UIControlStateNormal];
        [_matchmakeButton setBackgroundColor:[UIColor purpleColor]];
        [self.view addSubview:_matchmakeButton];
        [_matchmakeButton addTarget:self action:@selector(requestMatch) forControlEvents:UIControlEventTouchUpInside];
        
        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.2*_fHeight)];
        [_gameStatus setBackgroundColor:[UIColor magentaColor]];
        [self.view addSubview:_gameStatus];
        
        _gameButton = [[UIButton alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.45*_fHeight, 0.9*_fWidth, 0.1*_fHeight)];
        
        [_gameButton setTitle:@"Push them!" forState:UIControlStateNormal];
        [_gameButton setBackgroundColor:[UIColor purpleColor]];
        [_gameButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_gameButton];
        
        _matchOn = false;
        [self authenticateLocalPlayer];
    }
    return self;
}

- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    __weak GKLocalPlayer *wp = localPlayer;
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil)
        {
            //showAuthenticationDialogWhenReasonable: is an example method name. Create your own method that displays an authentication view when appropriate for your app.
            //[self showAuthenticationDialogWhenReasonable: viewController];
            [self presentViewController:viewController animated:false completion:^(void){
                [self authenticateLocalPlayer];}];
            NSLog(@"trying to auth local player");
        }
        else if (wp.isAuthenticated)
        {
            //authenticatedPlayer: is an example method name. Create your own method that is called after the loacal player is authenticated.
            [self authenticatedPlayer: wp];
        }
        else
        {
//            [self disableGameCenter];
            NSLog(@"Couldn't auth player");
        }
    };
}

- (void) requestMatch {
    if (!_matchOn) {
        GKMatchRequest *request = [[GKMatchRequest alloc] init];
        request.minPlayers = 2;
        request.maxPlayers = 2;
        
        GKMatchmakerViewController *mmvc = [[GKMatchmakerViewController alloc] initWithMatchRequest:request];
        mmvc.matchmakerDelegate = self;
        
        [self presentViewController:mmvc animated:YES completion:nil];
    }
}

- (void) authenticatedPlayer: (GKLocalPlayer*) lp {
    NSLog(@"%@ has been authenticated!", [lp displayName]);
}

- (void) sendMessage {
    if (_matchOn) {
        [_theMatch sendDataToAllPlayers:[@"Push now!" dataUsingEncoding:NSUTF8StringEncoding] withDataMode:GKMatchSendDataUnreliable error:nil];
    }
    [_gameStatus setText:@"Wait!"];
}

- (void)matchmakerViewControllerWasCancelled:(GKMatchmakerViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    // Implement any specific code in your game here.
}

- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFailWithError:(NSError *)error
{
    NSLog(@"Matchmaking failed with error: %@", [error localizedDescription]);
    [self dismissViewControllerAnimated:YES completion:nil];
    // Implement any specific code in your game here.
}

- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindMatch:(GKMatch *)match
{
    [self dismissViewControllerAnimated:YES completion:nil];
    _theMatch = match; // Use a retaining property to retain the match.
    match.delegate = self;
    if (!_matchOn && match.expectedPlayerCount == 0)
    {
        _matchOn = YES;
        // Insert game-specific code to start the match.
    }
}

- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    [_gameStatus setText:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
