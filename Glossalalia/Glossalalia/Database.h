//
//  Database.h
//  Glossolalia
//
//  Created by Paul on 2/13/2014
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "GADataEntry.h"
#import "DatabaseCaller.h"
#import "Globals.h"

@interface Database : NSObject

+(void)createEditableCopyOfDatabaseIfNeeded;

+(void)initDatabase;

+(NSMutableArray *)fetchAllEntries;

+(void)deleteEntry:(int)rowid;

+(void)eraseAllEntries;

+(void)saveEntryWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage *)image andPhrase:(bool)phrase;

+(void)saveEntry:(GADataEntry*)dataEntry;

+(void)updateDatabase;

+(void)updateDatabaseForTesting;

+(void)addEntries:(NSMutableArray*)array;

+(void)addEntriesForTesting:(NSMutableArray*)array;

+(void)cleanUpDatabaseForQuit;

+(BOOL)isPopulated;

+(void)enableTesting;

+(void)disableTesting;

@end
