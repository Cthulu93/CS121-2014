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
#import "GAHomeViewController.h"
#import "GADatabaseLoadingView.h"

@interface GAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property GAHomeViewController *homeView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillTerminate:(UIApplication *)application;

@end
