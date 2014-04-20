//
//  GATestViewController.h
//  Glossolalia
//
//  Created by Rupert Deese, Paul Dapolito, Alex Melville on 2/13/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GAMatchViewController.h"
#import "GADemoViewController.h"
#import "GAElement.h"
#import "GADataEntry.h"

@interface GATestViewController : UIViewController <GKMatchmakerViewControllerDelegate, GAMatchViewControllerDelegate, GAElementDelegate>

@property GAMatchViewController *matchVC;
@property GAElement *matchmakeButton;
@property GAElement *tutorialButton;
@property GAElement *singlePlayerButton;
@property UILabel *gameStatus;
@property UIButton *gameButton;
@property GKMatch *theMatch;
@property BOOL matchOn;

- (void) requestMatch;
- (void) authenticatedPlayer: (GKLocalPlayer*) lp;
- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID;

@end
