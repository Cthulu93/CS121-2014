//
//  GASlider.m
//  Glossalalia
//
//  Created by Paul on 2/23/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GASlider.h"

@implementation GASlider

-(id)initWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andMin:(int)min andMax:(int)max andLocal:(NSString*)local andRemote:(NSString*)remote
{
    self = [super initWithFrame:CGRectMake(x, y, width, height)];
    if(self){
        // Initialization code for local and remote strings
        _local = local;
        _remote = remote;
        
        // pull min and max values from initiliazation
        self.minimumValue = min;
        self.maximumValue = max;
        
        // Set this parameter to YES for constant updating in the sliderCHanged function
        self.continuous = YES;
        
        // route updates to sliderChanged
        [self addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

-(void)sliderChanged{
    float value = self.value;
    // round value from float, cast to int
    int roundedValue = (int)lroundf(value);
    
    // push to transfer handler
    [GATransferHandler transferWord:_local atSliderValue:roundedValue];
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
