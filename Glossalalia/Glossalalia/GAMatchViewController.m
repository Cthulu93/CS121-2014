//
//  GAMatchViewController.m
//  Glossalalia
//
//  Created by Rupert Deese on 2/24/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import "GAMatchViewController.h"

@interface GAMatchViewController ()
@property BOOL shouldShowLevel;
@property float fWidth, fHeight;
@end

@implementation GAMatchViewController

- (id)initWithMatch:(GKMatch*)match {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _theMatch = match;
        [self setNeedsStatusBarAppearanceUpdate];
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        // Code for Tutorial Screen
        _commandFont = [UIFont fontWithName:@"Avenir-Medium" size:40.0];
        
        NSString* firstText = @"Welcome to Glossalalia! Translate the words that appear here to figure out what button to press. If you don't have the right button, you'll have to work with your teammates...";
        
        CGSize textSize = [firstText sizeWithFont:_commandFont];
        
        _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
        _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                           *_fHeight, textSize.width, 0.15*_fHeight);
        _commandLabel = [[UILabel alloc] initWithFrame:_commandLabelStartFrame];
        [_commandLabel setFont:_commandFont];
        [_commandLabel setTextAlignment:NSTextAlignmentCenter];
        [_commandLabel setTextColor:[UIColor blackColor]];
        [_commandLabel setAdjustsFontSizeToFitWidth:YES];
        [_commandLabel setText:firstText];
        [_commandLabel sizeToFit];
        [self.view addSubview:_commandLabel];
        
        _progressFrame = CGRectMake(0, 20, 0, 0.1*_fHeight);
        _fullProgressFrame = CGRectMake(0, 20, 1.0*_fWidth, 0.1*_fHeight);
        _progressBar = [[UIView alloc] initWithFrame:_progressFrame];
        [self.view addSubview:_progressBar];
        
        float y = 0.29;
        
        _wordButtons = [[NSMutableArray alloc] initWithCapacity:0];
        
        // create GAElement Buttons
        GAElement *temp = [[GAElement alloc] initSingleTapWithFrame:CGRectMake(0.0*_fWidth, y*_fHeight, 1*_fWidth, 0.15 * _fHeight) andWord:nil];
        [_wordButtons addObject:temp];
        [self.view addSubview:temp];
        
        y += 0.15;
        
        temp = [[GAElement alloc] init5TapWithFrame:CGRectMake(0.0*_fWidth, y*_fHeight, 1*_fWidth, 0.15 * _fHeight) andWord:nil];
        [_wordButtons addObject:temp];
        [self.view addSubview:temp];
        
        y += 0.15;
        
        temp = [[GAElement alloc] initSlideLeftWithFrame:CGRectMake(0.0*_fWidth, y*_fHeight, 1*_fWidth, 0.15 * _fHeight) andWord:nil];
        [_wordButtons addObject:temp];
        [self.view addSubview:temp];
        
        y += 0.15;
        
        temp = [[GAElement alloc] initSlideDownWithFrame:CGRectMake(0.0*_fWidth, y*_fHeight, 1*_fWidth, 0.15 * _fHeight) andWord:nil];
        [_wordButtons addObject:temp];
        [self.view addSubview:temp];
        
        y += 0.15;
        
        _buttonColors = [[NSMutableArray alloc] initWithCapacity:0];
        for (GAElement *element in _wordButtons) {
            [_buttonColors addObject:element.backgroundColor];
        }
        
        [self doProgressBarColorAnimation];
        
        _skipButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_skipButton setFrame:CGRectMake(0, y*_fHeight, _fWidth, _fHeight*(1-y))];
        [_skipButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_skipButton setTitle: @"Skip" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipButton setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        [_skipButton addTarget:self action:@selector(skipTutorial) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_skipButton];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view.
    _theLevel = [[GALevelViewController alloc] initWithMatch:_theMatch];
    _theLevel.delegate = self;
    [self presentViewController:_theLevel animated:NO completion:nil];
}

- (void) doProgressBarColorAnimation {
    static NSInteger i = 0;
    
    if(i >= [_buttonColors count]) {
        i = 0;
    }
    
    float duration = 0.5;
    [UIView animateWithDuration:duration animations:^{
        _progressBar.backgroundColor = [_buttonColors objectAtIndex:i];
    } completion:^(BOOL finished) {
        ++i;
        [self doProgressBarColorAnimation];
    }];
}

- (void) skipTutorial {
    [self presentViewController:_theLevel animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark GALevelViewController methods

- (void) matchDidEnd {
    [self.delegate matchDidEnd];
}

- (void) levelDidEnd {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

@end
