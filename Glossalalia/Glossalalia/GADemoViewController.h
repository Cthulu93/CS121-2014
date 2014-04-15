//
//  GADemoViewController.h
//  Glossolalia
//
//  Created by Rupert Deese on 4/7/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GALevelViewController.h"
#import "GAElement.h"
#import "GADataEntry.h"

@interface GADemoViewController : UIViewController <GALevelViewControllerDelegate>

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

- (void) presentLevel;

@end
