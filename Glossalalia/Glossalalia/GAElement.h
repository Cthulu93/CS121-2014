//
//  GAElement.h
//  Glossalalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADataEntry.h"

@protocol GAElementDelegate <NSObject>

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word;

@end

@interface GAElement : UIButton

@property GADataEntry *word;
@property NSInteger *numToSwap;
@property NSInteger *numTap;
@property NSObject <GAElementDelegate> *delegate;

// regular button initializer
- (id)initWithFrame:(CGRect)frame;

// initalizer for button that is trigered by a single tap
-(id)initSingleTapWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initializer for a button that is triggered by five consecutive taps
-(id)init5TapWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a left slide
-(id)initSlideLeftWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a right slide
-(id)initSlideRightWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is trigered by a downward slide
-(id)initSlideDownWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is trigered by an upward slide
-(id)initSlideUpWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is randomly triggered (random amongst the GAElements we declared above)
-(id)initRandomWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

-(void)setupStandardButton;

// method to see if a received word matches the local word on a GAElement
-(BOOL)checkMatch:(NSString*)received;

@end
