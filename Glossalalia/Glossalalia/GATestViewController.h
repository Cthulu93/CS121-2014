//
//  GATestViewController.h
//  Glossalalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GAMatchViewController.h"
#import "FlatUIKit.h"

@interface GATestViewController : UIViewController <GKMatchmakerViewControllerDelegate, GAMatchViewControllerDelegate>

@property GAMatchViewController *matchVC;
@property FUIButton *matchmakeButton;
@property UILabel *gameStatus;
@property UIButton *gameButton;
@property GKMatch *theMatch;
@property BOOL matchOn;

- (void) requestMatch;
- (void) authenticatedPlayer: (GKLocalPlayer*) lp;
- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID;

@end
