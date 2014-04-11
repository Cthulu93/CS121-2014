//
//  GAMatchViewController.h
//  Glossolalia
//
//  Created by Rupert Deese on 2/24/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GALevelViewController.h"

@protocol GAMatchViewControllerDelegate <NSObject>

- (void) matchDidEnd;

@end

@interface GAMatchViewController : UIViewController <GALevelViewControllerDelegate>

@property NSObject <GAMatchViewControllerDelegate> *delegate;
@property GKMatch *theMatch;
@property GALevelViewController *theLevel;

@property UILabel *commandLabel;
@property CGRect commandLabelStartFrame;
@property CGRect commandLabelEndFrame;
@property UIFont *commandFont;

@property UIView *progressBar;
@property CGRect progressFrame;
@property CGRect fullProgressFrame;

@property NSMutableArray *wordButtons;
@property NSMutableArray *buttonColors;

@property UIButton *skipButton;

- (id)initWithMatch:(GKMatch*)match;

@end
