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

-(id)initSingleTapWithFrame:(CGRect)frame andWord:(GADataEntry*)word;
-(id)init5TapWithFrame:(CGRect)frame andWord:(GADataEntry*)word;
-(id)initSlideLeftWithFrame:(CGRect)frame andWord:(GADataEntry*)word;
-(id)initSlideRightWithFrame:(CGRect)frame andWord:(GADataEntry*)word;
-(id)initSlideDownWithFrame:(CGRect)frame andWord:(GADataEntry*)word;
-(id)initSlideUpWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

// initalizer for button that is randomly triggered (random amongst the GAElements we declared above)
-(id)initRandomWithFrame:(CGRect)frame andWord:(GADataEntry*)word;

-(void)touchDetected;

-(void)setupButton;

-(BOOL)checkMatch:(NSString*)received;

-(void) incrementBackgroundNumber;

- (void) endFiveTapWindow;

- (UIColor*) getRandomColor;

@end
