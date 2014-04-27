//
//  GAAppDelegate.m
//  Glossolalia
//
//  Created by Rupert Deese on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAAppDelegate.h"
#import "Globals.h"


@implementation GAAppDelegate

@synthesize managedObjectContext;;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // set high score to zero until we pull from Core Data
    highScore = 0;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    // create the home view controller
    _homeView = [[GAHomeViewController alloc] init];
    _homeView.managedObjectContext = [self managedObjectContext];
    
    
    // setup app database, update if needed
    [Database createEditableCopyOfDatabaseIfNeeded];
    [Database initDatabase];
    if (![Database isPopulated]) {
        if (TESTING) {
            if (consoleSuite) {
                NSLog(@"updating database for testing mode");
            }
            [Database updateDatabaseForTesting];}
        else {
            if (consoleSuite) {
                NSLog(@"updating database for regular mode");
            }
            [Database updateDatabase];
        }
    }
    
    // check the see if the user has a high score already saved
    [self checkForHighScore];
    
    /****** DATE STORAGE FOR DATABASE UPDATE
    NSDate *todaysDate = [NSDate date];
    //Create the dateformatter object
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init] ;
    
    //Set the required date format
    [formatter setDateFormat:@"MM-dd-yyyy"];
    
    //Get the string date
    NSString* str = [formatter stringFromDate:todaysDate];
    NSLog(str);
    ******/
        
    [self.window setRootViewController:_homeView];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Core Data usage methods
/* The following three methods allow us to use Core Data to save some information for our
   users. The code was taken from http://wiresareobsolete.com/wordpress/2009/12/adding-core-data-existing-iphone-projects/ and then edited to suit Glossolalia.
 */

- (NSManagedObjectContext *) managedObjectContext
{
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"Glossolalia.sqlite"]];
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                  initWithManagedObjectModel:[self managedObjectModel]];
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
        if (consoleSuite) {
            NSLog(@"Error creating Glossolalia.sqlite");
        }
    }
    
    return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// method to check Core Data for a user's high score
-(void) checkForHighScore
{
    // grab the managed object context
    NSManagedObjectContext *context = self.managedObjectContext;
    
    // create the Core Data request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Device" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    // execute the request
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    // there is no score in core data, so start the high score at zero
    if ([results count] == 0) {
        if (consoleSuite) {
            NSLog(@"Fetched no results from Core Data!");
        }
        
        // since we didn't find anything in Core Data, set the user's high score to zero
        highScore = 0;
    }
    // parse the Core Data array and choose the highest score
    else {
        if (consoleSuite) {
            NSLog(@"Fetched %d results from Core Data!", (int)[results count]);
        }
        
        // process Core Data array for highest score
        int highestFound = 0;
        for (int i = 0; i < [results count]; i++) {
            Device *devSave = results[i];
            NSNumber *devScore = devSave.highScore;
            int score = [devScore intValue];
            if (score > highestFound) {
                highestFound = score;
            }
        }
        
        highScore = highestFound;
        if (consoleSuite) {
            NSLog(@"highest score of %d was found", highScore);
        }
    }
    
}

@end
