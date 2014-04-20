//
//  GAAppDelegate.h
//  Glossolalia
//
//  Created by Rupert Deese, Paul Dapolito, Alex Melville on 2/13/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "GADataHandler.h"
#import "GADataViewController.h"
#import "GATestViewController.h"
#import "GAElementViewController.h"
#import "GADatabaseLoadingView.h"

@interface GAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property GADataViewController *dataView;
@property GATestViewController *testvc;

@property GAElementViewController *elementView;

@end
