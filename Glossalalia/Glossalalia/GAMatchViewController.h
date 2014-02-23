//
//  GAMatchViewController.h
//  Glossalalia
//
//  Created by Rupert Deese on 2/17/14.
//  Copyright (c) 2014 Rupert Deese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GADataHandler.h"
#import "GADataEntry.h"
#import "GAElement.h"

@protocol GAMatchViewControllerDelegate <NSObject>

- (void) matchDidEnd;

@end

@interface GAMatchViewController : UIViewController <GKMatchDelegate>

@property GKMatch *theMatch;
@property NSObject <GAMatchViewControllerDelegate> *delegate;
@property GADataHandler *dataHandler;
@property int score;
@property NSString *commandWord;
@property GADataEntry *buttonWord;

//@property UILabel *gameStatus;
//@property UIButton *gameButton;
//@property UIButton *quitButton;

@property UILabel *scoreLabel;
@property UILabel *commandLabel;
@property GAElement *wordButton;

- (id)initWithMatch:(GKMatch*)match;
- (void) endMatch;
- (void) localPlayerPressedButtonWithWord:(GADataEntry*)word;
- (void) remotePlayerPressedButtonWithWord:(GADataEntry*)word;
- (void) receivedCommandRequestFromPlayer:(NSString*)playerID;
- (NSData*) gameMessage:(NSString*)message asDataWithWord:(GADataEntry*)word;

@end
