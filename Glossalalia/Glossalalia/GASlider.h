//
//  GASlider.h
//  Glossolalia
//
//  Created by Paul on 2/23/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GASlider : UISlider

@property NSString *local;
@property NSString *remote;

-(id)initWithX:(int)x andY:(int)y andWidth:(int)width andHeight:(int)height andMin:(int)min andMax:(int)max andLocal:(NSString*)local andRemote:(NSString*)remote;

-(void)sliderChanged;

// method to see if a received word matches the local word on a GASlider
-(BOOL)checkMatch:(NSString*)received;

@end
