//
//  GAHomeViewController.m
//  Glossolalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAHomeViewController.h"

@interface GAHomeViewController ()
@property float fWidth, fHeight;
@property bool authenticated;
@end

@implementation GAHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // populate member variables
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        _authenticated = NO;
        _settingsOpen = NO;
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        // create settings button
        _settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
        [_settingsButton setTitle:[NSString stringWithUTF8String:"\u2699"] forState:UIControlStateNormal];
        [_settingsButton setTitleColor:[self getRandomColor] forState:UIControlStateNormal];
        _settingsButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [_settingsButton setEnabled:YES];
        [_settingsButton setReversesTitleShadowWhenHighlighted:YES];
        [_settingsButton setShowsTouchWhenHighlighted:YES];
        [_settingsButton addTarget:self action:@selector(showSettingsPanel) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_settingsButton];
        
        // create settings panel
        _settingsPanel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _fWidth, 50)];
        
        // setup phrases switch
        _phrasesSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(_fWidth * 1 / 3 + 7, 20, 5, 5)];
        _phrasesSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
        [_phrasesSwitch setOn:YES];
        [_phrasesSwitch setTintColor:[UIColor whiteColor]];
        [_phrasesSwitch addTarget:self action:@selector(flipPhrases) forControlEvents:UIControlEventValueChanged];
        [_settingsPanel addSubview:_phrasesSwitch];
        
        // setup phrases label
        UILabel *phrasesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_fWidth * 1 / 3, 5, 70, 15)];
        [phrasesLabel setTextColor:[UIColor whiteColor]];
        [phrasesLabel setText:@"phrases"];
        [phrasesLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:18.0]];
        [_settingsPanel addSubview:phrasesLabel];
        
        // setup words switch
        _wordsSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(_fWidth * 2 / 3, 20, 5, 5)];
        _wordsSwitch.transform = CGAffineTransformMakeScale(0.6, 0.6);
        [_wordsSwitch setOn:YES];
        [_wordsSwitch setTintColor:[UIColor whiteColor]];
        [_wordsSwitch addTarget:self action:@selector(flipWords) forControlEvents:UIControlEventValueChanged];
        [_settingsPanel addSubview:_wordsSwitch];
    
        // setup words label
        UILabel *wordsLabel = [[UILabel alloc] initWithFrame:CGRectMake(_fWidth * 2 / 3, 5, 70, 15)];
        [wordsLabel setTextColor:[UIColor whiteColor]];
        [wordsLabel setText:@"words"];
        [wordsLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:18.0]];
        [_settingsPanel addSubview:wordsLabel];
        
        // height placeholder for buttons
        float buttonYLoc = 0.55*_fHeight;
        
        // create multiplayer button
        GADataEntry *playWord = [[GADataEntry alloc] initWithEnglish:@"Play with Friends" andSpanish:@"Play with Friends" andImage:nil andPhrase:nil];
        _matchmakeButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:playWord];
        _matchmakeButton.delegate = self;

        [self.view addSubview:_matchmakeButton];
        [_matchmakeButton setEnabled:YES];
        
        // increment height placeholder
        buttonYLoc += 0.15*_fHeight;
        
        // create tutorial button
        GADataEntry *tutorialWord = [[GADataEntry alloc] initWithEnglish:@"Tutorial" andSpanish:@"Tutorial" andImage:nil andPhrase:nil];
        _tutorialButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:tutorialWord];
        _tutorialButton.delegate = self;
        [self.view addSubview:_tutorialButton];
        
        // increment height placeholder
        buttonYLoc += 0.15*_fHeight;
        
        // create single-player mode button
        GADataEntry *singlePlayerWord = [[GADataEntry alloc] initWithEnglish:@"Single Player" andSpanish:@"Single Player" andImage:nil andPhrase:nil];
        _singlePlayerButton = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0*_fWidth, buttonYLoc, 1.0*_fWidth, 0.15*_fHeight) andWord:singlePlayerWord];
        _singlePlayerButton.delegate = self;
        [self.view addSubview:_singlePlayerButton];
        
        // initialize game status label
        _gameStatus = [[UILabel alloc] initWithFrame:CGRectMake(0.05*_fWidth, 0.2*_fHeight, 0.9*_fWidth, 0.3*_fHeight)];
        [_gameStatus setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:50.0]];
        [_gameStatus setText:@"Glossolalia"];
        [_gameStatus setTextAlignment:NSTextAlignmentCenter];
        [_gameStatus setTextColor:[UIColor blackColor]];
        [self.view addSubview:_gameStatus];
        
        // there is no match going, so we then authenticate the local player.
        _matchOn = false;
        [self authenticateLocalPlayer];
    }
    return self;
}

// code to generate a random color
- (UIColor*) getRandomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.3;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

// code to display the settings panel when the user presses the gear
- (void) showSettingsPanel
{
    if (!_settingsOpen) {
        [self.view addSubview:_settingsPanel];
        _settingsOpen = YES;
        
        // change the color of the gear and bring it forward
        [_settingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        // generate a new random color each time the panel is presented
        [_settingsPanel setBackgroundColor:[self getRandomColor]];
        [self.view bringSubviewToFront:_settingsButton];
    }
    else {
        _settingsOpen = NO;
        // reset the color of the gear, remove the settings panel from the subviews
        [_settingsButton setTitleColor:[self getRandomColor] forState:UIControlStateNormal];
        [_settingsPanel removeFromSuperview];
    }
}

// code to close the settings panel
- (void) closeSettingsPanel
{
    [_settingsButton setTitleColor:[self getRandomColor] forState:UIControlStateNormal];
    [_settingsPanel removeFromSuperview];
    _settingsOpen = NO;
}

// flips the phrases constant held in Constants.m
- (void) flipPhrases
{
    usePhrases = !usePhrases;
    // alert the user if both words and phrases are disabled
    if (!usePhrases && !useWords) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Translations Enabled"
                                                        message:@"You must enable one of either words or phrases to play Glossolalia!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        usePhrases = YES;
        [_phrasesSwitch setOn:YES animated:YES];
    }
    if (consoleSuite) {
        NSLog(usePhrases ? @"phrases enabled" : @"phrases disabled");
    }
}

// flips the words constant held in Constants.m
- (void) flipWords
{
    useWords = !useWords;
    // alert the user if both words and phrases are disabled
    if (!useWords && !usePhrases) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Translations Enabled"
                                                        message:@"You must enable one of either words or phrases to play Glossolalia!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        useWords = YES;
        [_wordsSwitch setOn:YES animated:YES];
    }
    
    if (consoleSuite) {
        NSLog(useWords ? @"words enabled" : @"words disabled");
    }
}

// Called to log the player in to Game center. Presents an Apple VC for authentication.
- (void) authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    __weak GKLocalPlayer *wp = localPlayer;
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:false completion:^(void){
                [self authenticateLocalPlayer];}];
            
            if (consoleSuite) {
                NSLog(@"trying to auth local player");
            }
        }
        else if (wp.isAuthenticated) {
            [self authenticatedPlayer: wp];
        }
        else {
            if (consoleSuite) {
                NSLog(@"Couldn't auth player");
            }
            
            _authenticated = NO;
            // disable multiplayer button
            [_matchmakeButton setAlpha:.5];
            [_matchmakeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_matchmakeButton setEnabled:NO];
        }
    };
}

// Requests a match using Game Center. Presents an Apple VC for match creation.
- (void) requestMatch
{
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
- (void) authenticatedPlayer: (GKLocalPlayer*) lp
{
    _authenticated = YES;
    [_matchmakeButton setAlpha:1];
    [_matchmakeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_matchmakeButton setEnabled:YES];
    
    if (consoleSuite) {
        NSLog(@"%@ has been authenticated!", [lp displayName]);
    }
}

#pragma mark GAMatchViewController methods

- (void) matchDidEnd
{
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
    if (consoleSuite) {
        NSLog(@"%lu recovery options.", (unsigned long)[[error localizedRecoveryOptions] count]);
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription] message:[error localizedRecoverySuggestion] delegate:self cancelButtonTitle:[error localizedRecoveryOptions][0] otherButtonTitles:[error localizedRecoveryOptions][1], nil];
    [alert show];
    
    if (consoleSuite) {
        NSLog(@"Matchmaking failed with error: %@", [error localizedDescription]);
    }
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

- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID
{
    [_gameStatus setText:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}

#pragma mark GAElementDelegate methods

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word
{
    // close settings panel
    [_settingsPanel removeFromSuperview];
    _settingsOpen = NO;
    [self closeSettingsPanel];
    
    // handle button press
    if ([word.local isEqual: @"Play with Friends"]) {
        if (consoleSuite) {
            NSLog(@"play with friends pressed");
        }
        if (_authenticated) {
            [self requestMatch];
        }
        else {
            // attempt to authenticate the user again
            if (consoleSuite) {
                NSLog(@"retrying authentication");
            }
            [self authenticateLocalPlayer];
        }
    }
    else if ([word.local isEqual:@"Tutorial"]) {
        GADemoViewController *demo = [[GADemoViewController alloc] initWithNibName:nil bundle:nil];
        [self presentViewController:demo animated:YES completion:nil];
    }
    else if ([word.local isEqual:@"Single Player"]) {
        // create single player view controller
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

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
