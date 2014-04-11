//
//  GADataEntry.m
//  Glossalalia
//
//  Created by Paul on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GADataEntry.h"

@implementation GADataEntry

-(id)initWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage*)image andPhrase:(bool)phrase{
    self = [super init];
    
    if (self) {
        _english = english;
        _spanish = spanish;
        _image = image;
        _phrase = phrase;
        
        // randomly decide whether english or spanish is local.
//        if ((arc4random() % 20) < 10) _englishLocal = YES;
//        else _englishLocal = NO;
        
        // FIXME always english is local we need to modify this constructor to make it
        // possible to make the other language local if the user wants.
        _englishLocal = YES;
    }
    
    return self;
}


-(NSString*)local {
    if (_englishLocal) return _english;
    else return _spanish;
}

-(NSString*)remote {
    if (_englishLocal) return _spanish;
    else return _english;
}

@end
