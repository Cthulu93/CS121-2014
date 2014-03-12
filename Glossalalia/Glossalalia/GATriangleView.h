//
//  GATriangleView.h
//  Glossalalia
//
//  Created by Rupert Deese on 3/11/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GATriangleView : UIView
@property UIColor *color;
@property NSString *direction;

- (id)initWithFrame:(CGRect)frame andColor:(UIColor*) color;


@end
