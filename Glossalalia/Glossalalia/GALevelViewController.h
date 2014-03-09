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
#import "ROUSession.h"

@protocol GALevelViewControllerDelegate <NSObject>

- (void) matchDidEnd;
- (void) levelDidEnd;

@end

@interface GALevelViewController : UIViewController <GKMatchDelegate, GAElementDelegate, ROUSessionDelegate>

@property GKMatch *theMatch;
@property ROUSession *rouSession;
@property NSString *GAButtonPressedMessage, *GACommandListMessage,
                   *GAScoreChangeMessage, *GAEndMatchMessage;
@property NSObject <GALevelViewControllerDelegate> *delegate;
@property GADataHandler *dataHandler;

@property int score;
@property int highScore;
@property int numWordsCorrect;
@property int numWordsNeededToSpeedUp;
@property int numButtonWordsPerPlayer;
@property CGFloat commandCompletionTimeLimit;
@property float commandCompletionTimeRemaining;

@property NSMutableArray *legalCommandWords;
@property NSMutableArray *commandsFromLocalButtons;
@property NSString *commandWord;
@property NSMutableArray *buttonWords;

@property UILabel *scoreLabel;
@property UILabel *commandLabel;
@property CGRect commandLabelStartFrame;
@property CGRect commandLabelEndFrame;
@property UILabel *commandTimeLabel;
@property NSMutableArray *wordButtons;

@property UIView *progressBar;
@property CGRect progressFrame;

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
//- (void) decrementAndCheckCommandTimeLimit;
- (void) commandTimedOut;
- (void) sendGameMessage:(NSString*)message asDataWithWord:(NSString*)remoteWord andPoints:(NSNumber*) points;
- (void) endMatch;

@end
