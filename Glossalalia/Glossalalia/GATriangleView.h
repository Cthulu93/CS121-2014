//
//  GATriangleView.h
//  Glossolalia
//
//  Created by Rupert Deese, Paul Dapolito, Alex Melville on 3/11/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GATriangleView : UIView
@property UIColor *color;
@property NSString *direction;

- (id)initWithFrame:(CGRect)frame andColor:(UIColor*) color;
-(void)drawRect:(CGRect)rect;

@end
