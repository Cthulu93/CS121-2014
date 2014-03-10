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
        
        // create buttons, etc.
//        _matchmakeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_matchmakeButton.layer setCornerRadius:10.0];
//        [_matchmakeButton.layer setBorderWidth:2.0];
//        [_matchmakeButton.layer setBorderColor:[UIColor purpleColor].CGColor];
//        [_matchmakeButton setFrame:CGRectMake(0.2*_fWidth, 0.6*_fHeight, 0.6*_fWidth, 0.15*_fHeight)];
//        [_matchmakeButton setTitle: @"Play" forState:UIControlStateNormal];
//        [_matchmakeButton setTitle: @"Wait" forState:UIControlStateDisabled];
//        [_matchmakeButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:30.0]];
//        [_matchmakeButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
//        [_matchmakeButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//        [_matchmakeButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [_matchmakeButton setEnabled:NO];
//        [self.view addSubview:_matchmakeButton];
        
        _matchmakeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *disableButton = [UIImage buttonImageWithColor:[UIColor whiteColor]
                                                  cornerRadius:10.0
                                                   shadowColor:[UIColor grayColor]
                                                  shadowInsets:UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0)];
        UIImage *normalButton = [UIImage buttonImageWithColor:[UIColor whiteColor]
                                                 cornerRadius:10.0
                                                  shadowColor:[UIColor purpleColor]
                                                 shadowInsets:UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0)];
        UIImage *highlightButton = [UIImage buttonImageWithColor:[UIColor whiteColor]
                                                    cornerRadius:10.0
                                                     shadowColor:[UIColor redColor]
                                                    shadowInsets:UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0)];
        
        [_matchmakeButton setFrame:CGRectMake(0.2*_fWidth, 0.6*_fHeight, 0.6*_fWidth, 0.15*_fHeight)];
        [_matchmakeButton setTitle: @"Play" forState:UIControlStateNormal];
        [_matchmakeButton setTitle: @"Wait" forState:UIControlStateDisabled];
        [_matchmakeButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:30.0]];
        [_matchmakeButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [_matchmakeButton setBackgroundImage:disableButton forState:UIControlStateDisabled];
        [_matchmakeButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_matchmakeButton setBackgroundImage:normalButton forState:UIControlStateNormal];
        [_matchmakeButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [_matchmakeButton setBackgroundImage:highlightButton forState:UIControlStateHighlighted];
        [_matchmakeButton setEnabled:NO];
        [self.view addSubview:_matchmakeButton];
        
//        _matchmakeButton = [[FUIButton alloc] initWithFrame:CGRectMake(0.2*_fWidth, 0.6*_fHeight, 0.6*_fWidth, 0.15*_fHeight)];
//        _matchmakeButton.buttonColor = [UIColor carrotColor];
//        _matchmakeButton.shadowColor = [UIColor pumpkinColor];
//        _matchmakeButton.shadowHeight = 3.0f;
//        _matchmakeButton.cornerRadius = 6.0f;
//        [_matchmakeButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:30.0]];
//        [_matchmakeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
//        [_matchmakeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
//        [_matchmakeButton setTitle: @"Play" forState:UIControlStateNormal];
//        [_matchmakeButton setTitle: @"Wait" forState:UIControlStateDisabled];
//        [_matchmakeButton setEnabled:NO];
//        [self.view addSubview:_matchmakeButton];

        
        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.3*_fHeight)];
        //[_gameStatus setBackgroundColor:[UIColor magentaColor]];
        [_gameStatus setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:50.0]];
        [_gameStatus setText:@"Glossolalia"];
        [_gameStatus setTextAlignment:NSTextAlignmentCenter];
        [_gameStatus setTextColor:[UIColor blackColor]];
        [self.view addSubview:_gameStatus];
        
        // there is no match going, and then we authenticate the local player.
        _matchOn = false;
        [self authenticateLocalPlayer];
    }
    return self;
}

// Called to log the player in to Game center. Presents an Apple VC for authentication.
- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    __weak GKLocalPlayer *wp = localPlayer;
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil)
        {
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

// Requests a match using Game Center. Presents an Apple VC for match creation.
- (void) requestMatch {
    if (!_matchOn) {
        GKMatchRequest *request = [[GKMatchRequest alloc] init];
        request.minPlayers = 2;
        request.maxPlayers = 4;
        
        GKMatchmakerViewController *mmvc = [[GKMatchmakerViewController alloc] initWithMatchRequest:request];
        mmvc.matchmakerDelegate = self;
        
        [self presentViewController:mmvc animated:YES completion:nil];
    }
}

// Method called when player is authenticated. more should go here at some point.
- (void) authenticatedPlayer: (GKLocalPlayer*) lp {
    NSLog(@"%@ has been authenticated!", [lp displayName]);
    [_matchmakeButton addTarget:self action:@selector(requestMatch) forControlEvents:UIControlEventTouchUpInside];
    [_matchmakeButton setEnabled:YES];
}

#pragma mark GAMatchViewController methods

- (void) matchDidEnd {
    [self dismissViewControllerAnimated:YES completion:nil];
    _matchOn = NO;
}

#pragma mark GKMatchmakerViewControllerDelegate methods

- (void)matchmakerViewControllerWasCancelled:(GKMatchmakerViewController *)viewController
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFailWithError:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Implement any specific code in your game here.
    NSLog(@"%lu recovery options.", (unsigned long)[[error localizedRecoveryOptions] count]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedRecoverySuggestion] delegate:self cancelButtonTitle:[error localizedRecoveryOptions][0] otherButtonTitles:[error localizedRecoveryOptions][1], nil];
    [alert show];
    
    NSLog(@"Matchmaking failed with error: %@", [error localizedDescription]);
}

- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindMatch:(GKMatch *)match
{    
    [self dismissViewControllerAnimated:YES completion:^(void) {
        if (!_matchOn && match.expectedPlayerCount == 0)
        {
            _matchOn = YES;
            _matchVC = [[GAMatchViewController alloc] initWithMatch:match];
            [_matchVC setDelegate:self];
            [self presentViewController:_matchVC animated:NO completion:nil];
        }
    }];
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
