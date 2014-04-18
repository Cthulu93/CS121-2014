//
//  GALevelViewController.h
//  Glossolalia
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
                   *GAScoreChangeMessage, *GAEndMatchMessage, *GAConfirmCorrectButtonPressed;
@property NSObject <GALevelViewControllerDelegate> *delegate;
@property GADataHandler *dataHandler;

@property float score;
@property float highScore;
@property int numWordsCorrect;
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

@property NSMutableArray *buttonColors;

- (id)initWithMatch:(GKMatch*)match;

- (void) doProgressBarColorAnimation;
- (void) doProgressBarScoreChange:(BOOL) increase;

- (void) getNewCommandWordThatIsNot:(NSString*)remoteWord;
- (void) getNewCommandWord;

- (void) remotePlayerPressedButtonWithWord:(NSString*)remoteWord;

- (void) changeScoreBy:(NSNumber*) points;
- (void) locallyUpdateScoreBy:(NSNumber*)points;

- (void) stopCommandCompletionTimer;
- (void) startCommandCompletionTimer;
- (void) commandTimedOut;

- (void) checkForSpeedup;

- (void) sendGameMessage:(NSString*)message asDataWithWord:(NSString*)remoteWord andPoints:(NSNumber*) points;
- (void) endMatch;
- (void) receiveDataFromPlayer:(NSData*)data;

- (void) updateGAElementWithWord:(GAElement *)elem;
- (void) exchangeWordsWithNewWord:(NSString*)newWord andOldWord:(NSString*)oldWord;

-(void)session:(ROUSession *)session preparedDataForSending:(NSData *)data;
-(void)session:(ROUSession *)session receivedData:(NSData *)data;

- (void) localPlayerPressedButtonForWord:(GADataEntry *)word;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

- (void) match:(GKMatch *)match didFailWithError:(NSError *)error;
- (void) match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID;
- (void) match:(GKMatch *)match player:(NSString *)playerID didChangeState:(GKPlayerConnectionState)state;
- (BOOL)match:(GKMatch *)match shouldReinvitePlayer:(NSString *)playerID;

- (void)didReceiveMemoryWarning;
- (BOOL) prefersStatusBarHidden;

@end
