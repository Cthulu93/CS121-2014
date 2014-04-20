//
//  GADataEntry.m
//  Glossolalia
//
//  Created by Paul on 2/13/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import "GADataEntry.h"

@implementation GADataEntry

-(id)initWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage*)image andPhrase:(bool)phrase
{
    self = [super init];
    
    if (self) {
        _english = english;
        _spanish = spanish;
        _image = image;
        _phrase = phrase;
        
        // randomly generate number to determine which language is local
        int randomInt = (int)(arc4random() % 100);
        
        if (randomInt >= 50) {
        _englishLocal = YES;
        }
        else {
            _englishLocal = NO;
        }
    }
    
    return self;
}

// returns the local word for a data entry
-(NSString*)local
{
    if (_englishLocal) {
        return _english;
    }
    else {
        return _spanish;
    }
}

// returns the remote word for a data entry
-(NSString*)remote
{
    if (_englishLocal) {
        return _spanish;
    }
    else {
        return _english;
    }
}

@end
