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
@end

@implementation GAMatchViewController

- (id)initWithMatch:(GKMatch*)match {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _theMatch = match;
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
    [self presentViewController:_theLevel animated:YES completion:nil];
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

@end
