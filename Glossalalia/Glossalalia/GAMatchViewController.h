//
//  GAMatchViewController.h
//  Glossalalia
//
//  Created by Rupert Deese on 2/17/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <GameKit/GameKit.h>

@protocol GAMatchViewControllerDelegate <NSObject>

- (void) matchDidEnd;

@end

@interface GAMatchViewController : UIViewController <GKMatchDelegate>

@property GKMatch *theMatch;
@property NSObject <GAMatchViewControllerDelegate> *delegate;

@property UILabel *gameStatus;
@property UIButton *gameButton;
@property UIButton *quitButton;

- (id)initWithMatch:(GKMatch*)match;
- (void) endMatch;

@end
