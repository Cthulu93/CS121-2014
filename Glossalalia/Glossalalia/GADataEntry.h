//
//  GADataEntry.h
//  Glossolalia
//
//  Created by Paul on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GADataEntry : NSObject

@property NSString *english;
@property NSString *spanish;

// Determines which string is displayed on which players'
// screens. If true, then the english word is displayed
// on the player's button, and the spanish word scrolls
// across his teammate's screen. And vice versa if false.
@property BOOL englishLocal;

@property NSInteger ID;

@property UIImage *image;

@property bool phrase;

-(id)initWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage*)image andPhrase:(bool)phrase;

-(NSString*) local;
-(NSString*) remote;


@end
