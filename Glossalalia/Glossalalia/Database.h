//
//  Database.h
//  Glossalalia
//
//  Created by Paul on 2/13/2014
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "GADataEntry.h"
#import "DatabaseCaller.h"

@interface Database : NSObject

+(void)createEditableCopyOfDatabaseIfNeeded;

+(void)initDatabase;

+(NSMutableArray *)fetchAllEntries;

+(void)deleteEntry:(int)rowid;

+(void)eraseAllEntries;

+(void)saveEntryWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage *)image;

+(void)saveEntry:(GADataEntry*)dataEntry;

+(void)updateDatabase;

+(void)addEntries:(NSMutableArray*)array;

+(void)cleanUpDatabaseForQuit;

@end
