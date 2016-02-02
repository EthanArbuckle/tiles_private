//
//  EAGameOverview.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/2/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EAGameOverview : UIView

@property (nonatomic) NSInteger gameScore;
@property (nonatomic) NSInteger timerInterval;
@property (nonatomic, retain) UILabel *gameScoreLabel;
@property (nonatomic, retain) UILabel *timerLabel;
@property (nonatomic, retain) UIView *scoreContainer;
@property (nonatomic, retain) UIView *timerContainer;

- (void)stepUpGameScore;
- (void)setGameScore:(NSInteger)score;
- (void)animateTimerAway;
- (void)animateScoreIn;
- (void)stepDownTimer;

@end
