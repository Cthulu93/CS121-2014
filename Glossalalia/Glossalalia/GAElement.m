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

-(id)initSingleTapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UITapGestureRecognizer *singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        singleGesture.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:singleGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}


-(id)init5TapWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UITapGestureRecognizer *fiveGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        fiveGesture.numberOfTapsRequired = 5;
        
        [self addGestureRecognizer:fiveGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}

-(id)initSlideLeftWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionLeft;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}

-(id)initSlideRightWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionRight;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}

-(id)initSlideDownWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionDown;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}

-(id)initSlideUpWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andLocal:(NSString*)local andRemote:(NSString*)remote{
    
    self = [GAElement buttonWithType:UIButtonTypeRoundedRect];
    self.frame = CGRectMake(x,y,width,height);
    
    if(self){
        UISwipeGestureRecognizer *slideGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(touchDetected)];
        slideGesture.direction = UISwipeGestureRecognizerDirectionUp;
        slideGesture.numberOfTouchesRequired = 1;
        
        [self addGestureRecognizer:slideGesture];
        [self setTitle:local forState:UIControlStateNormal];
        
        _local = local;
        _remote = remote;
    }
    
    return self;
}

// This method is called when a touch is detected to transfer the local word
-(void)touchDetected{
    [GATransferHandler transferWord:self.local];
}

-(BOOL)checkMatch:(NSString*)received{
    if(received == _local){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

@end
