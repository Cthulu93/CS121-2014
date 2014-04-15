//
//  GATestViewController.m
//  Glossolalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GATestViewController.h"

@interface GATestViewController ()
@property float fWidth, fHeight;
@property bool authenticated;
@end

@implementation GATestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        _authenticated = NO;
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        float buttonYLoc = 0.55*_fHeight;
        
        GADataEntry *playWord = [[GADataEntry alloc] initWithEnglish:@"Play with Friends" andSpanish:@"Play with Friends" andImage:nil andPhrase:nil];
        
        _matchmakeButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:playWord];
        _matchmakeButton.delegate = self;

        [self.view addSubview:_matchmakeButton];
        [_matchmakeButton setEnabled:YES
         ];
        
        buttonYLoc += 0.15*_fHeight;
        
        // create tutorial button
        GADataEntry *tutorialWord = [[GADataEntry alloc] initWithEnglish:@"Tutorial" andSpanish:@"Tutorial" andImage:nil andPhrase:nil];
        
        _tutorialButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:tutorialWord];
        _tutorialButton.delegate = self;
        [self.view addSubview:_tutorialButton];
        
        buttonYLoc += 0.15*_fHeight;
        
        // create single-player mode button
        GADataEntry *singlePlayerWord = [[GADataEntry alloc] initWithEnglish:@"Single Player" andSpanish:@"Single Player" andImage:nil andPhrase:nil];
        
        _singlePlayerButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:singlePlayerWord];
        _singlePlayerButton.delegate = self;
        [self.view addSubview:_singlePlayerButton];
        
        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.3*_fHeight)];
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
            [self presentViewController:viewController animated:false completion:^(void){
                [self authenticateLocalPlayer];}];
            NSLog(@"trying to auth local player");
        }
        else if (wp.isAuthenticated)
        {
            [self authenticatedPlayer: wp];
        }
        else
        {
//            [self disableGameCenter];
            NSLog(@"Couldn't auth player");
            _authenticated = NO;
            // disable multiplayer button
            [_matchmakeButton setAlpha:.5];
            [_matchmakeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_matchmakeButton setEnabled:NO];

        }
    };
}

// Requests a match using Game Center. Presents an Apple VC for match creation.
- (void) requestMatch {
    if (!_matchOn) {
        GKMatchRequest *request = [[GKMatchRequest alloc] init];
        request.minPlayers = 2;
        request.maxPlayers = 2; // 2 PLAYER MAXIMUM FOR NOW
        
        GKMatchmakerViewController *mmvc = [[GKMatchmakerViewController alloc] initWithMatchRequest:request];
        mmvc.matchmakerDelegate = self;
        
        [self presentViewController:mmvc animated:YES completion:nil];
    }
}

// Method called when player is authenticated. more should go here at some point.
- (void) authenticatedPlayer: (GKLocalPlayer*) lp {
    NSLog(@"%@ has been authenticated!", [lp displayName]);
    _authenticated = YES;
    [_matchmakeButton setEnabled:YES];
}

#pragma mark GAMatchViewController methods

- (void) matchDidEnd {
    [self dismissViewControllerAnimated:YES completion:nil];
    [_theMatch disconnect];
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

#pragma mark GAElementDelegate methods

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word {
    if ([word.local isEqual: @"Play with Friends"]) {
        NSLog(@"play with friends pressed");
        if (_authenticated) {
            [self requestMatch];
        }
        else {
            NSLog(@"retrying authentication");
            [self authenticateLocalPlayer];
        }
    } else if ([word.local isEqual:@"Tutorial"]) {
        GADemoViewController *demo = [[GADemoViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:demo animated:YES completion:nil];
    } else if ([word.local isEqual:@"Single Player"]) {
        GALevelViewController *singlePlayer = [[GALevelViewController alloc] initWithMatch:nil];
        singlePlayer.delegate = self;
        [self presentViewController:singlePlayer animated:YES completion:nil];
    }
    
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

- (BOOL) prefersStatusBarHidden {
    return YES;
}

@end
