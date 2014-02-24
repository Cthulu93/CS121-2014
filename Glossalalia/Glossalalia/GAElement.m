//
//  GAElement.m
//  Glossalalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAElement.h"

@implementation GAElement

// All GAElement buttons take the usual coordinate and dimension parameters, as well as a local NSString and a remote NSString

-(id)initSingleTapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        UITapGestureRecognizer *singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        singleGesture.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:singleGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}


-(id)init5TapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        
        UITapGestureRecognizer *fiveGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        fiveGesture.numberOfTapsRequired = 5;
        
        [self addGestureRecognizer:fiveGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideLeftWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideRightWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionRight;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideDownWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionDown;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

-(id)initSlideUpWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andWord:(GADataEntry*)word{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        _word = word;
        
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionUp;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:_word.local forState:UIControlStateNormal];
    }
    
    return self;
}

// This method is called when a touch is detected to transfer the local word
-(void)touchDetected{
    [_delegate localPlayerPressedButtonForWord:_word];
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
