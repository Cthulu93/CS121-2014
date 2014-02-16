//
//  GAAppDelegate.h
//  Glossalalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "GADataViewController.h"
#import "GATestViewController.h"

@interface GAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property GADataViewController *dataView;
@property GATestViewController *testvc;

@end
