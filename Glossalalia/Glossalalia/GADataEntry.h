//
//  GADataEntry.h
//  Glossalalia
//
//  Created by Paul on 2/13/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GADataEntry : NSObject

@property NSString *english;
@property NSString *spanish;

@property NSInteger ID;

@property UIImage *image;

-(id)initWithEnglish:(NSString*)english andSpanish:(NSString*)spanish andImage:(UIImage*)image;

@end
