//
//  GAElement.m
//  Glossalalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAElement.h"

@implementation GAElement

static NSInteger *const NUMBER_OF_TAPS_UNTIL_SWAP = 5;

// All GAElement buttons take the usual coordinate and dimension parameters, as well as a local NSString and a remote NSString

-(id)initSingleTapWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UITapGestureRecognizer *singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        singleGesture.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:singleGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - single tap",_word.local] forState:UIControlStateNormal];
    }
    
    return self;
}


-(id)init5TapWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UITapGestureRecognizer *fiveGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        fiveGesture.numberOfTapsRequired = 5;

        [self addGestureRecognizer:fiveGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - five tap",_word.local] forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideLeftWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeCustom];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - slide left",_word.local] forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideRightWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionRight;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - slide right",_word.local] forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideDownWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionDown;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - slide down",_word.local] forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideUpWithFrame:(CGRect)frame andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        [self setupStandardButton];
        
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionUp;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:[NSString stringWithFormat:@"%@ - slide up",_word.local] forState:UIControlStateNormal];
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
    [_delegate localPlayerPressedButtonForWord:_word];
}

// TODO - stylize buttons within initalizers to differentiate them accordingly //
- (void) setupStandardButton {
    [self.layer setCornerRadius:10.0];
    [self.layer setBorderWidth:2.0];
    [self.layer setBorderColor:[UIColor purpleColor].CGColor];
    [self.titleLabel setFont:[UIFont fontWithName:@"Avenir-MediumOblique" size:30.0]];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
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

@end
