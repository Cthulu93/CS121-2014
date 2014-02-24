//
//  GAMatchViewController.h
//  Glossalalia
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

- (id)initWithMatch:(GKMatch*)match;

@end
