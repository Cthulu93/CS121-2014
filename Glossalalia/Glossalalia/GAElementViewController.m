//
//  GAElementViewController.m
//  Glossolalia
//
//  Created by Paul on 2/20/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import "GAElementViewController.h"

@interface GAElementViewController ()

@end

@implementation GAElementViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        GAElement *singleTapButton = [[GAElement alloc] initSingleTapWithX:80 andY:180 andWidth:160 andHeight:40 andLocal:@"Single Tap Test" andRemote:@"TEST"];
//        [self.view addSubview:singleTapButton];
//        
//        GAElement *fiveTapButton = [[GAElement alloc] init5TapWithX:80 andY:210 andWidth:160 andHeight:40 andLocal:@"5 Tap Test" andRemote:@"TEST"];
//        [self.view addSubview:fiveTapButton];
//        
//        GAElement *slideLeftButton = [[GAElement alloc] initSlideLeftWithX:80 andY:250 andWidth:160 andHeight:40 andLocal:@"Slide Left Test" andRemote:@"TEST"];
//        [self.view addSubview:slideLeftButton];
//
//        GAElement *slideRightButton = [[GAElement alloc] initSlideRightWithX:80 andY:290 andWidth:160 andHeight:40 andLocal:@"Slide Right Test" andRemote:@"TEST"];
//        [self.view addSubview:slideRightButton];
//        
//        GAElement *slideDownButton = [[GAElement alloc] initSlideDownWithX:80 andY:330 andWidth:160 andHeight:40 andLocal:@"Slide Down Test" andRemote:@"TEST"];
//        [self.view addSubview:slideDownButton];
//        
//        GAElement *slideUpButton = [[GAElement alloc] initSlideUpWithX:80 andY:370 andWidth:160 andHeight:40 andLocal:@"Slide Up Test" andRemote:@"TEST"];
//        [self.view addSubview:slideUpButton];
        
        GASlider *slider = [[GASlider alloc] initWithX:80 andY:410 andWidth:90 andHeight:20 andMin:1 andMax:5 andLocal:@"test slider local" andRemote:@"test slider remote"];
        [self.view addSubview:slider];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
