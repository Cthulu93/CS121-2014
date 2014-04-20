//
//  GATriangleView.m
//  Glossolalia
//
//  Created by Rupert Deese, Paul Dapolito, Alex Melville on 3/11/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import "GATriangleView.h"

@implementation GATriangleView

- (id)initWithFrame:(CGRect)frame andColor:(UIColor*) color
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _color = color;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
 -(void)drawRect:(CGRect)rect
 {
     CGContextRef ctx = UIGraphicsGetCurrentContext();
     
     CGContextBeginPath(ctx);
     CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));  // top left
     CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMidY(rect));  // mid right
     CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
     CGContextClosePath(ctx);
     CGContextSetFillColorWithColor(ctx, _color.CGColor);
     CGContextFillPath(ctx);
 }

@end
