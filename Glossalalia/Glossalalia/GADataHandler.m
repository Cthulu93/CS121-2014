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

-(GADataEntry*)grabRandomEntry{
    NSUInteger numEntries = [_dataEntries count];
    
    // generate random number with numEntries as uppder bound
    NSUInteger rand = arc4random_uniform(numEntries);
    
    return [_dataEntries objectAtIndex:rand];
}

-(NSMutableArray*)grabRandomEntries:(int)num{
    // find out how many entries we have to work with
    NSUInteger numEntries = [_dataEntries count];
    
    // create array of num entries selected at random
    NSMutableArray *randomEntries = [NSMutableArray new];
    for(int i = 0; i < num; ++i){
        NSUInteger rand = arc4random_uniform(numEntries);
        [randomEntries addObject:[_dataEntries objectAtIndex:rand]];
    }
    
    return randomEntries;
}

@end
