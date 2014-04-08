//
//  GADemoViewController.m
//  Glossalalia
//
//  Created by Rupert Deese on 4/7/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
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
        // Custom initialization
        [self setNeedsStatusBarAppearanceUpdate];
        
        _fWidth = self.view.frame.size.width;
        _fHeight = self.view.frame.size.height;
        
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
    NSString *secondText = @"Welcome to Glossalalia!";
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
        NSString *secondText = @"Translate the words that appear here to figure out what button to press.";
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
            NSString *secondText = @"If you don't have the right button, you'll have to work with your teammates...";
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
                NSString *secondText = @"Work to fill up your progress bar! If you miss a translation it will empty out.";
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
                    NSString *secondText = @"Good luck!";
                    CGSize textSize = [secondText sizeWithFont:_commandFont];
                    float duration = textSize.width/_fWidth*3.5;
                    _commandLabelStartFrame = CGRectMake(1.0*_fWidth, 0.145*_fHeight, textSize.width, 0.15*_fHeight);
                    _commandLabelEndFrame = CGRectMake(-textSize.width, 0.145
                                                       *_fHeight, textSize.width, 0.15*_fHeight);
                    [_commandLabel setFrame:_commandLabelStartFrame];
                    [_commandLabel setText:secondText];
                    
                    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                        [_commandLabel setFrame:_commandLabelEndFrame];
                        [_progressBar setFrame:_progressFrame];
                    } completion:^(BOOL finished) {
                        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end