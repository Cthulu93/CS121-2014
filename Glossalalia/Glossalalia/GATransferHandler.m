//
//  GATransferHandler.m
//  Glossalalia
//
//  Created by Paul on 2/21/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GATransferHandler.h"

@implementation GATransferHandler

+(void)transferWord:(NSString*)word{
    NSLog(@"transferring word %@", word);
}

+(void)transferWord:(NSString *)word atSliderValue:(int)value{
    NSLog(@"transferring word %@ with value %d", word, value);
}

@end
