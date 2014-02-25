//
//  GALevelViewController.h
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

@protocol GALevelViewControllerDelegate <NSObject>

- (void) matchDidEnd;
- (void) levelDidEnd;

@end

@interface GALevelViewController : UIViewController <GKMatchDelegate, GAElementDelegate>

@property GKMatch *theMatch;
@property NSObject <GALevelViewControllerDelegate> *delegate;
@property GADataHandler *dataHandler;

@property int score;
@property int numButtonWordsPerPlayer;
@property int commandCompletionTimeLimit;
@property int commandCompletionTimeRemaining;

@property NSMutableArray *legalCommandWords;
@property NSString *commandWord;
@property NSMutableArray *buttonWords;

//@property UILabel *gameStatus;
//@property UIButton *gameButton;
//@property UIButton *quitButton;

@property UILabel *scoreLabel;
@property UILabel *commandLabel;
@property UILabel *commandTimeLabel;
@property NSMutableArray *wordButtons;

@property UIButton *exitButton;
@property NSTimer *commandRequestTimer;
@property NSTimer *commandCompletionTimer;

- (id)initWithMatch:(GKMatch*)match;

//- (void) askRandomPlayerForNewCommandWord;
- (void) getNewCommandWord;
- (void) addLegalCommandWords:(NSArray*)newWords;
- (void) remotePlayerPressedButtonWithWord:(NSString*)remoteWord;
//- (void) receivedCommandListRequestFromPlayer:(NSString*)playerID;
//- (void) receivedCommandWord:(GADataEntry*)word;
- (void) changeScoreBy:(NSNumber*) points;
- (void) decrementAndCheckCommandTimeLimit;
- (void) commandTimedOut;
- (NSData*) gameMessage:(NSString*)message asDataWithWord:(NSString*)remoteWord andPoints:(NSNumber*) points;
- (void) endLevel;
- (void) endMatch;

@end
