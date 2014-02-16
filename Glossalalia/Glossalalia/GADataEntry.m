//
//  GADataEntry.m
//  Glossalalia
//
//  Created by Paul on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GADataEntry.h"

@implementation GADataEntry

-(id)initWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage*)image{
    self = [super init];
    
    if (self) {
        _english = english;
        _spanish = spanish;
        _image = image;
    }
    
    return self;
}

@end
