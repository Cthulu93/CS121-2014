//
//  Database.m
//  Glossalalia
//
//  Created by Paul on 2/13/2014
//  Copyright (c) 2014 Harvey Mudd College. All rights reserved.
//

#import "Database.h"

@implementation Database

static sqlite3 *db;

static sqlite3_stmt *createEntries;
static sqlite3_stmt *fetchEntries;
static sqlite3_stmt *insertEntry;
static sqlite3_stmt *deleteEntry;
static sqlite3_stmt *updateEntry;

+ (void)createEditableCopyOfDatabaseIfNeeded {
    BOOL success;

    // allocate future error message (if necessary)
    NSError *error;
    
    // look for an existing database file and grab the file
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentDirectory stringByAppendingPathComponent:@"entries.sql"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    
    // if failed to find one, copy the empty entries database into the location
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"entries.sql"];
    
    // send error message if we could not create the entries.sql file
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"FAILED to create writable database file with message, '%@'.", [error localizedDescription]);
    }
}

+ (void)initDatabase {
    // create the statement strings
    const char *createEntriesString = "CREATE TABLE IF NOT EXISTS entries (rowid INTEGER PRIMARY KEY AUTOINCREMENT, english TEXT, spanish TEXT, photo BLOB)";
    const char *fetchEntriesString = "SELECT * FROM entries";
    const char *insertEntryString = "INSERT INTO entries (english, spanish, photo) VALUES (?, ?, ?)";
    const char *deleteEntryString = "DELETE FROM entries WHERE rowid=?";
    
    // create the path to the database
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"entries.sql"];
    
    // open the database connection
    if (sqlite3_open([path UTF8String], &db)) {
        NSLog(@"ERROR opening the db");
    }
    
    //init table statement
    if (sqlite3_prepare_v2(db, createEntriesString, -1, &createEntries, NULL) != SQLITE_OK) {
        NSLog(@"Failed to prepare entries create table statement");
    }
    
    // execute the table creation statement
    int success;
    success = sqlite3_step(createEntries);
    sqlite3_reset(createEntries);
    if (success != SQLITE_DONE) {
        NSLog(@"ERROR: failed to create entries table");
    }
    
    //init retrieval statement
    if (sqlite3_prepare_v2(db, fetchEntriesString, -1, &fetchEntries, NULL) != SQLITE_OK) {
        NSLog(@"ERROR: failed to prepare entries fetching statement");
    }
    
    //init insertion statement
    if (sqlite3_prepare_v2(db, insertEntryString, -1, &insertEntry, NULL) != SQLITE_OK) {
        NSLog(@"ERROR: failed to prepare entry inserting statement");
    }
    
    // init deletion statement
    if (sqlite3_prepare_v2(db, deleteEntryString, -1, &deleteEntry, NULL) != SQLITE_OK) {
        NSLog(@"ERROR: failed to prepare delete entry statement");
    }
}

+(NSMutableArray *)fetchAllEntries
{
    // array of entries to be returned
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:0];
    
    while (sqlite3_step(fetchEntries) == SQLITE_ROW) {
        
        // query columns from fetch statement
        char *englishChars = (char *) sqlite3_column_text(fetchEntries, 1);
        char *spanishChars = (char *) sqlite3_column_text(fetchEntries, 2);
        
        // convert image blob to UIImage
        int len = sqlite3_column_bytes(fetchEntries, 3);
        NSData *imageData = [[NSData alloc] initWithBytes: sqlite3_column_blob(fetchEntries, 3) length: len];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        // convert englush and spanish words to NSStrings
        NSString *english = [NSString stringWithUTF8String:englishChars];
        NSString *spanish = [NSString stringWithUTF8String:spanishChars];
        
        // create entry objec
        GADataEntry *temp = [[GADataEntry alloc] initWithEnglish:english andSpanish:spanish andImage:image];
        
        // add the entry object to our array
        [ret addObject:temp];
        
    }
    
    // reset the statement, return the array
    sqlite3_reset(fetchEntries);
    return ret;
    
}

+(void)deleteEntry:(int)rowid
{
    // bind the row id, step the statement, reset the statement, check for error
    sqlite3_bind_int(deleteEntry, 1, rowid);
    int success = sqlite3_step(deleteEntry);
    sqlite3_reset(deleteEntry);
    if (success != SQLITE_DONE) {
        NSLog(@"ERROR: failed to delete entry");
    }
}

// TO DO- fix this function so that it does not erase an arbitrarily large number of database entries
+(void)eraseAllEntries
{

    // TODO- enable delete to work properly on the exact number of entries
    NSMutableArray *array = [Database fetchAllEntries];
    int numEntries = [array count];
    
    // grab all of the entries, get a count of how many we have, and delete them one-by-one
    NSLog(@"erasing all database entries");
    for(int i = 1; i < 100000; ++i){
        [Database deleteEntry:i];
    }
}

+(void)saveEntryWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage *)image
{
    // bind data to the statement
    sqlite3_bind_text(insertEntry, 1, [english UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertEntry, 2, [spanish UTF8String], -1, SQLITE_TRANSIENT);
    
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, .7)];
    sqlite3_bind_blob(insertEntry, 3, [imageData bytes], [imageData length], SQLITE_TRANSIENT);
    
    // insert into the database
    int success = sqlite3_step(insertEntry);
    sqlite3_reset(insertEntry);
    if (success != SQLITE_DONE) {
        NSLog(@"ERROR: failed to insert entry");
    }
}

+(void)saveEntry:(GADataEntry*)dataEntry
{
    // bind data to the statement
    sqlite3_bind_text(insertEntry, 1, [dataEntry.english UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(insertEntry, 2, [dataEntry.spanish UTF8String], -1, SQLITE_TRANSIENT);
    
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(dataEntry.image, .7)];
    sqlite3_bind_blob(insertEntry, 3, [imageData bytes], [imageData length], SQLITE_TRANSIENT);
    
    // insert into the database
    int success = sqlite3_step(insertEntry);
    sqlite3_reset(insertEntry);
    if (success != SQLITE_DONE) {
        NSLog(@"ERROR: failed to insert entry");
    }
}

+(void)updateDatabase{
    // first erase all of the database entries, then make the HTTP request
    [Database eraseAllEntries];
    DatabaseCaller *updateCall = [[DatabaseCaller alloc] initForCallwithTarget:self andAction:@selector(addEntries:)];
}

+(void)addEntries:(NSMutableArray*)array{
    // add an entrie array of entries to the database
    NSLog(@"There are %d entries in the database", [array count]);
    for(NSMutableDictionary *dict in array) {
        NSString *english = [dict objectForKey:@"English"];
        NSString *spanish = [dict objectForKey:@"Spanish"];
        
        UIImage *image = nil;
        
        [Database saveEntryWithEnglish:english andSpanish:spanish andImage:image];
    }
    NSLog(@"Database update complete");
}

+ (void)cleanUpDatabaseForQuit
{
    // finalize frees the compiled statements, close closes the database connection
    sqlite3_finalize(fetchEntries);
    sqlite3_finalize(insertEntry);
    sqlite3_finalize(deleteEntry);
    sqlite3_finalize(createEntries);
    sqlite3_finalize(updateEntry);
    sqlite3_close(db);
}

+(BOOL)isPopulated
{
    if ([[Database fetchAllEntries] count] == 0){
        NSLog(@"database is not populated");
        return FALSE;
    }
    else{
        NSLog(@"database is populated");
        return TRUE;
    }
}

@end
