//
//  GAElement.h
//  Glossolalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "GADataEntry.h"
#import "GATriangleView.h"

@protocol GAElementDelegate <NSObject>

- (void) localPlayerPressedButtonForWord:(GADataEntry*)word; 

@end

@interface GAElement : UIButton

typedef enum {
    SINGLE_TAP,
    FIVE_TAP,
    SLIDE_LEFT,
    SLIDE_RIGHT,
    SLIDE_UP,
    SLIDE_DOWN
} ButtonType;

@property ButtonType type;
@property GADataEntry *word;
@property NSTimer *nTapTimer;
@property NSInteger numToSwap;
@property NSInteger numTap;
@property int curNumTaps;
@property NSObject <GAElementDelegate> *delegate;
@property UIColor *randomColor;
@property UIColor *brightColor;
@property CGFloat backgroundOpacity;

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

-(void)setupButton;

-(void) incrementBackgroundNumber;

// method to see if a received word matches the local word on a GAElement
-(BOOL)checkMatch:(NSString*)received;

@end
