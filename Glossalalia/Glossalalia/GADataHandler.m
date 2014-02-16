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
    }
    
    return self;
}

-(GADataEntry*)grabRandomEntry{
    NSUInteger numEntries = [_dataEntries count];
    
    // generate random number with numEntries as uppder bound
    NSUInteger rand = arc4random_uniform(numEntries);
    
    return [_dataEntries objectAtIndex:rand];
}



@end
