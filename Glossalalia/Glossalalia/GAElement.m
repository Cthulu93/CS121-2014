//
//  GAElement.m
//  Glossalalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAElement.h"

@implementation GAElement

// This is hacky right here, but for some reason in the levelviewcontroller
// the numTap variable increments by 4 every time, so to make it 3
// taps we set this variable to 3*4 = 12
static NSInteger *const NUMBER_OF_TAPS_UNTIL_SWAP = 12;

// All GAElement buttons take the usual coordinate and dimension parameters, as well as a local NSString and a remote NSString

-(id)initSingleTapWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = SINGLE_TAP;
        [self setupButton];
        
        _word = word;
        
        UITapGestureRecognizer *singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        singleGesture.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:singleGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}


-(id)init5TapWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = FIVE_TAP;
        [self setupButton];
        
        _word = word;
        
//        UITapGestureRecognizer *fiveGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
//        fiveGesture.numberOfTapsRequired = 5;
        
        _curNumTaps = 0;
        UITapGestureRecognizer *oneGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(incrementBackgroundNumber)];
        oneGesture.numberOfTapsRequired = 1;

        [self addGestureRecognizer:oneGesture];
        //[self addGestureRecognizer:fiveGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideLeftWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = SLIDE_LEFT;
        [self setupButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideRightWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = SLIDE_RIGHT;
        [self setupButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionRight;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideDownWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = SLIDE_DOWN;
        [self setupButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionDown;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideUpWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeSystem];
    
    if(self){
        self.frame = frame;
        _type = SLIDE_UP;
        [self setupButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionUp;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

// Randomly selects one of the GAElement types, and creates it
-(id)initRandomWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    int random = arc4random_uniform(6);
    
    if (random == 0) {
        self = [[GAElement alloc] initSingleTapWithFrame:frame andWord:word];
    }
    else if (random == 1){
        self = [[GAElement alloc] init5TapWithFrame:frame andWord:word];
    }
    else if (random == 2){
        self = [[GAElement alloc] initSlideLeftWithFrame:frame andWord:word];
    }
    else if (random == 3){
        self = [[GAElement alloc] initSlideRightWithFrame:frame andWord:word];
    }
    else if (random == 4){
        self = [[GAElement alloc] initSlideUpWithFrame:frame andWord:word];
    }
    else{
        self = [[GAElement alloc] initSlideDownWithFrame:frame andWord:word];
    }
    
    return self;
}

// This method is called when a touch is detected to transfer the local word
-(void)touchDetected{
    switch (_type) {
        case SINGLE_TAP: {
            [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
                [self setTransform:CGAffineTransformMakeScale(0.98, 0.8)];
            }completion:^(BOOL finished){
                if (finished)
                    [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
                        [self setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                    }completion:^(BOOL finished){
                        [_delegate localPlayerPressedButtonForWord:_word];
                    }];
                else
                    [_delegate localPlayerPressedButtonForWord:_word];
            }];
        }; break;
        case FIVE_TAP: {
            [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
                [self setTransform:CGAffineTransformMakeScale(0.98, 0.6)];
            }completion:^(BOOL finished){
                if (finished)
                    [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveLinear animations:^(void){
                        [self setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                    }completion:^(BOOL finished){
                        [_delegate localPlayerPressedButtonForWord:_word];
                        [self endFiveTapWindow];
                    }];
                else {
                    [_delegate localPlayerPressedButtonForWord:_word];
                    [self endFiveTapWindow];
                }
            }];
        }; break;
        case SLIDE_LEFT: {
            [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionCurveEaseOut animations:nil completion:^(BOOL finished){
                [_delegate localPlayerPressedButtonForWord:_word];
            }];
        }; break;
        case SLIDE_RIGHT: {
            [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionCurveEaseOut animations:nil completion:^(BOOL finished){
                [_delegate localPlayerPressedButtonForWord:_word];
            }];
        }; break;
        case SLIDE_UP: {
            [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionFlipFromTop | UIViewAnimationOptionCurveEaseOut animations:nil completion:^(BOOL finished){
                [_delegate localPlayerPressedButtonForWord:_word];
            }];
        }; break;
        case SLIDE_DOWN: {
            [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom | UIViewAnimationOptionCurveEaseOut animations:nil completion:^(BOOL finished){
                [_delegate localPlayerPressedButtonForWord:_word];
            }];
        }; break;
    }
}

//

// TODO - stylize buttons within initalizers to differentiate them accordingly //
- (void) setupButton {
    
    _backgroundOpacity = 0.3;
    
    _randomColor = [self randomColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:_randomColor];
    
    CGFloat hue = 0, sat = 0, bright = 0, alpha = 0;
    if ([_randomColor getHue:&hue saturation:&sat brightness:&bright alpha:&alpha])
        NSLog(@"Success");
    else
        NSLog(@"failure");
    
    _brightColor = [UIColor colorWithHue:hue saturation:sat brightness:bright+0.2 alpha:alpha];
    
    switch (_type) {
        case SINGLE_TAP: {
//            UILabel *leftBar = [UILabel new];
//            [leftBar setBackgroundColor:[UIColor whiteColor]];
//            [self addSubview: leftBar];
//            [leftBar setFrame:CGRectMake(10, 0, 5, self.frame.size.height)];
//            UILabel *rightBar = [UILabel new];
//            [rightBar setBackgroundColor:[UIColor whiteColor]];
//            [self addSubview: rightBar];
//            [rightBar setFrame:CGRectMake(self.frame.size.width-10, 0, 5, self.frame.size.height)];
        }; break;
        case FIVE_TAP: {
            CGRect numFrame = CGRectMake(0, 0, self.frame.size.width/5, self.frame.size.height);
            for (int i = 1; i <= 5; ++i) {
                UILabel *num = [UILabel new];
                [num setTag:i];
                [self addSubview:num];
                [num setText:[NSString stringWithFormat:@"%d", i]];
                [num setTextAlignment:NSTextAlignmentCenter];
                [num setFont:[UIFont fontWithName:@"Avenir-Medium" size:70.0]];
                [num setBackgroundColor:[UIColor clearColor]];
                [num setTextColor:_brightColor];
                [num setAlpha:_backgroundOpacity];
                [num setFrame:numFrame];
                numFrame.origin.x += self.frame.size.width/5;
            }
            [[self viewWithTag:5] setAlpha:1.0];
        }; break;
        case SLIDE_LEFT: {
            GATriangleView *rightTri = [[GATriangleView alloc] initWithFrame:CGRectMake(self.frame.size.width - self.frame.size.height, 0, self.frame.size.height, self.frame.size.height)andColor:_brightColor];
            //[rightTri setAlpha:0.5];
            [rightTri setTransform:CGAffineTransformMakeRotation(2*M_PI_2)];
            [self addSubview: rightTri];
        }; break;
        case SLIDE_RIGHT: {
            GATriangleView *leftTri = [[GATriangleView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)andColor:_brightColor];
            //[leftTri setAlpha:0.5];
            [self addSubview: leftTri];
        }; break;
        case SLIDE_UP: {
            CGRect newFrame = CGRectMake((self.frame.size.width - self.frame.size.height)/2, 0, self.frame.size.height, self.frame.size.height);
            GATriangleView *bottomTri = [[GATriangleView alloc] initWithFrame:newFrame andColor:_brightColor];
            //[bottomTri setAlpha:0.5];
            [bottomTri setTransform:CGAffineTransformMakeRotation(3*M_PI_2)];
            [self addSubview: bottomTri];
        }; break;
        case SLIDE_DOWN: {
            CGRect newFrame = CGRectMake((self.frame.size.width - self.frame.size.height)/2, 0, self.frame.size.height, self.frame.size.height);
            GATriangleView *topTri = [[GATriangleView alloc] initWithFrame:newFrame andColor:_brightColor];
            //[topTri setAlpha:0.5];
            [topTri setTransform:CGAffineTransformMakeRotation(M_PI_2)];
            [self addSubview: topTri];
        }; break;
    }
    
    [self.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:30.0]];
    
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    
    self.numToSwap = NUMBER_OF_TAPS_UNTIL_SWAP;
    self.numTap = 0;
}

-(BOOL)checkMatch:(NSString*)received{
    if(received == _word.local){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

- (void) incrementBackgroundNumber {
    ++_curNumTaps;
    if (_curNumTaps == 1) {
        _nTapTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(endFiveTapWindow) userInfo:Nil repeats:NO];
    }
    [[self viewWithTag:_curNumTaps] setAlpha:1.0];
    if (_curNumTaps == 5) {
        [_nTapTimer invalidate];
        [(UILabel*)[self viewWithTag:_curNumTaps] setTextColor:[UIColor whiteColor]];
        [self touchDetected];
    }
}

- (void) endFiveTapWindow {
    _curNumTaps = 0;
    for (int i = 1; i <= 4; ++i) {
        [[self viewWithTag:i] setAlpha:_backgroundOpacity];
    }
    [(UILabel*)[self viewWithTag:5] setTextColor:_brightColor];
    [_nTapTimer invalidate];
}

- (UIColor*) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.3;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
