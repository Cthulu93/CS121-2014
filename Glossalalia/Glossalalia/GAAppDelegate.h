//
//  GAAppDelegate.h
//  Glossolalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Database.h"
#import "GADataHandler.h"
#import "GAHomeViewController.h"
#import "GALevelViewController.h"
#import "Device.h"
#import "Globals.h"

@interface GAAppDelegate : UIResponder <UIApplicationDelegate> {
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;

@property GAHomeViewController *homeView;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (NSString *)applicationDocumentsDirectory;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void) applicationWillResignActive:(UIApplication *)application;
- (void) applicationDidEnterBackground:(UIApplication *)application;
- (void) applicationWillEnterForeground:(UIApplication *)application;
- (void) applicationDidBecomeActive:(UIApplication *)application;
- (void) applicationWillTerminate:(UIApplication *)application;

-(void) checkForHighScore;

@end
