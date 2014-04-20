//
//  GADemoViewController.m
//  Glossolalia
//
//  Created by Rupert Deese, Paul Dapolito, Alex Melville on 4/7/14.
//  Copyright (c) 2014 Rupert Deese, Paul Dapolito, Alex Melville. All rights reserved.
//

#import "GADemoViewController.h"

@interface GADemoViewController ()
@property float fWidth, fHeight;
@end

@implementation GADemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        // Custom initialization
        [self setNeedsStatusBarAppearanceUpdate];
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
        _commandFont = [UIFont fontWithName:@"Avenir-Medium" size:40.0];
        
        NSString* firstText = @"Welcome to Glossolalia! Translate the words that appear here to figure out what button to press. If you don't have the right button, you'll have to work with your teammates...";
        
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
        
        float buffer = 0.02;
        y += buffer;
        
        _skipButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_skipButton setFrame:CGRectMake(0, y*_fHeight, _fWidth*0.4, _fHeight*(1-y-buffer))];
        [_skipButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Medium" size:30.0]];
        [_skipButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_skipButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [_skipButton setTitle: @"Back" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipButton setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        [_skipButton addTarget:self action:@selector(skipTutorial) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_skipButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    _theLevel = [[GALevelViewController alloc] initWithMatch:nil];
    _theLevel.delegate = self;
    
    NSString *secondText = @"Welcome to Glossolalia!";
    CGSize textSize = [secondText sizeWithFont:_commandFont];
    float duration = textSize.width/_fWidth*3.5;
    _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
    _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                       *_fHeight, textSize.width, 0.15*_fHeight);
    [_commandLabel setFrame:_commandLabelStartFrame];
    [_commandLabel setText:secondText];
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [_commandLabel setFrame:_commandLabelEndFrame];
    } completion:^(BOOL finished) {
        NSString *secondText = @"During the game, words will appear in this bar. Press the button with the correct translation!";
        CGSize textSize = [secondText sizeWithFont:_commandFont];
        float duration = textSize.width/_fWidth*3.5;
        _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
        _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                           *_fHeight, textSize.width, 0.15*_fHeight);
        [_commandLabel setFrame:_commandLabelStartFrame];
        [_commandLabel setText:secondText];
        
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
            [_commandLabel setFrame:_commandLabelEndFrame];
        } completion:^(BOOL finished) {
            NSString *secondText = @"The button you need may be on your teammate's screen... work together!";
            CGSize textSize = [secondText sizeWithFont:_commandFont];
            float duration = textSize.width/_fWidth*3.5;
            _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
            _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                               *_fHeight, textSize.width, 0.15*_fHeight);
            [_commandLabel setFrame:_commandLabelStartFrame];
            [_commandLabel setText:secondText];
            
            [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                [_commandLabel setFrame:_commandLabelEndFrame];
            } completion:^(BOOL finished) {
                NSString *secondText = @"You can tell the different types of buttons apart by their background designs.";
                CGSize textSize = [secondText sizeWithFont:_commandFont];
                float duration = textSize.width/_fWidth*3.5;
                _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
                _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                                   *_fHeight, textSize.width, 0.15*_fHeight);
                [_commandLabel setFrame:_commandLabelStartFrame];
                [_commandLabel setText:secondText];
                
                [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                    [_commandLabel setFrame:_commandLabelEndFrame];
                } completion:^(BOOL finished) {
                    NSString *secondText = @"The progress bar shows your current streak. If you miss a word, your streak will end.";
                    CGSize textSize = [secondText sizeWithFont:_commandFont];
                    float duration = textSize.width/_fWidth*3.5;
                    _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
                    _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                                       *_fHeight, textSize.width, 0.15*_fHeight);
                    [_commandLabel setFrame:_commandLabelStartFrame];
                    [_commandLabel setText:secondText];
                    
                    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                        [_commandLabel setFrame:_commandLabelEndFrame];
                        [_progressBar setFrame:_fullProgressFrame];
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                            [_commandLabel setFrame:_commandLabelEndFrame];
                            [_progressBar setFrame:_progressFrame];
                        } completion:^(BOOL finished) {
                            NSString *secondText = @"Hang around for a practice round!";
                            CGSize textSize = [secondText sizeWithFont:_commandFont];
                            float duration = textSize.width/_fWidth*3.5;
                            _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
                            _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                                               *_fHeight, textSize.width, 0.15*_fHeight);
                            [_commandLabel setFrame:_commandLabelStartFrame];
                            [_commandLabel setText:secondText];
                            
                            [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                                [_commandLabel setFrame:_commandLabelEndFrame];
                            } completion:^(BOOL finished) {
                                [self presentViewController:_theLevel animated:NO completion:nil];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
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
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

#pragma mark GALevelViewController methods

- (void) matchDidEnd {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) levelDidEnd {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
