//
//  GAHomeViewController.h
//  Glossolalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GAMatchViewController.h"
#import "GADemoViewController.h"
#import "GAElement.h"
#import "GADataEntry.h"
#import "FlatUIKit.h"

@interface GAHomeViewController : UIViewController <GKMatchmakerViewControllerDelegate, GAMatchViewControllerDelegate, GAElementDelegate>

@property GAMatchViewController *matchVC;

@property GAElement *matchmakeButton;
@property GAElement *tutorialButton;
@property GAElement *singlePlayerButton;

@property UILabel *gameStatus;

@property UIButton *gameButton;
@property UIButton *settingsButton;

@property UISwitch *wordsSwitch;
@property UISwitch *phrasesSwitch;

@property UIView *settingsPanel;

@property GKMatch *theMatch;

@property BOOL matchOn;
@property BOOL settingsOpen;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (UIColor*) getRandomColor;
- (void) showSettingsPanel;
- (void) closeSettingsPanel;
- (void) flipPhrases;
- (void) flipWords;

- (void) authenticateLocalPlayer;
- (void) requestMatch;
- (void) authenticatedPlayer: (GKLocalPlayer*) lp;

- (void) matchDidEnd;
- (void)matchmakerViewControllerWasCancelled:(GKMatchmakerViewController *)viewController;
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFailWithError:(NSError *)error;
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindMatch:(GKMatch *)match;
- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID;

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word;

- (void)viewDidLoad;

- (void)didReceiveMemoryWarning;

- (BOOL) prefersStatusBarHidden;

@end
