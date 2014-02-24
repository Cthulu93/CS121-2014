//
//  GATransferHandler.h
//  Glossalalia
//
//  Created by Paul on 2/21/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GATransferHandler : NSObject

// Class method to transfer a local word
+(void)transferWord:(NSString*)word;

// Class method to transfer a local word and the value of the GASlider
+(void)transferWord:(NSString *)word atSliderValue:(int)value;

@end
