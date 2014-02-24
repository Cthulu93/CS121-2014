//
//  GAElement.h
//  Glossalalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GATransferHandler.h"
#import "GADataEntry.h"

@protocol GAElementDelegate <NSObject>

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word;

@end

@interface GAElement : UIButton

@property GADataEntry *word;
@property NSObject <GAElementDelegate> *delegate;

// regular button initializer
- (id)initWithFrame:(CGRect)frame;

// initalizer for button that is trigered by a single tap
-(id)initSingleTapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// initializer for a button that is triggered by five consecutive taps
-(id)init5TapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a left slide
-(id)initSlideLeftWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a right slide
-(id)initSlideRightWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a downward slide
-(id)initSlideDownWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// // initalizer for button that is trigered by an upward slide
-(id)initSlideUpWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word;

// method to see if a received word matches the local word on a GAElement
-(BOOL)checkMatch:(NSString*)received;

@end
