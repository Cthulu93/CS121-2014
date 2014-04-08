//
//  GADataHandler.m
//  Glossalalia
//
//  Created by Paul on 2/16/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GADataHandler.h"

@implementation GADataHandler

-(id)init{
    self = [super init];
    
    if (self) {
        _dataEntries = [Database fetchAllEntries];
//        if ([_dataEntries count] == 0) {
//            NSLog(@"DB is empty in GADataHandler init");
//        }
//        else NSLog(@"DB entries are %d", [_dataEntries count]);
    }
    
    return self;
}

-(GADataEntry*)grabRandomEntryWithPhrases:(bool)includePhrases{
    NSUInteger numEntries = [_dataEntries count];
    
    // generate random number with numEntries as upper bound
    NSUInteger rand = arc4random_uniform(numEntries);
    GADataEntry *randEntry = [_dataEntries objectAtIndex:rand];
//    if (includePhrases) {
//        while ([[randEntry english] rangeOfString:@" "].location == NSNotFound) {
//            rand = arc4random_uniform(numEntries);
//            randEntry = [_dataEntries objectAtIndex:rand];
//        }
//    }
    
    return randEntry;
}

-(NSMutableArray*)grabRandomEntries:(int)num withPhrases:(BOOL)includePhrases{
    // find out how many entries we have to work with
    NSUInteger numEntries = [_dataEntries count];
    
    // create array of num entries selected at random
    NSMutableArray *randomEntries = [NSMutableArray new];
    while ([randomEntries count] < num) {
        [randomEntries addObject:[self grabRandomEntryWithPhrases:includePhrases]];
    }

    
    return randomEntries;
}

@end
