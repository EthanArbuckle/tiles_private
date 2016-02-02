//
//  EAGameOverview.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/2/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAGameOverview.h"

@implementation EAGameOverview

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        
        [self setBackgroundColor:[UIColor colorWithRed:0.910 green:0.929 blue:0.937 alpha:1.00]];
        
        _gameScore = 0;
        _timerInterval = 3;
        
        _scoreContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        [_scoreContainer setBackgroundColor:[UIColor colorWithRed:0.757 green:0.827 blue:0.851 alpha:1.00]];
        [_scoreContainer setCenter:[self center]];
        [_scoreContainer setAlpha:0];
        [self addSubview:_scoreContainer];
        
        _timerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        [_timerContainer setBackgroundColor:[UIColor colorWithRed:0.757 green:0.827 blue:0.851 alpha:1.00]];
        [_timerContainer setCenter:[self center]];
        [self addSubview:_timerContainer];
        
        _timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, [_timerContainer frame].size.width, 20)];
        [_timerLabel setTextAlignment:NSTextAlignmentCenter];
        [_timerLabel setTextColor:[UIColor whiteColor]];
        [_timerLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
        [_timerLabel setText:[NSString stringWithFormat:@"%ld", (long)_timerInterval]];
        [_timerContainer addSubview:_timerLabel];
        
        UILabel *scoreText = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, [_scoreContainer frame].size.width, 10)];
        [scoreText setTextColor:[UIColor whiteColor]];
        [scoreText setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        [scoreText setTextAlignment:NSTextAlignmentCenter];
        [scoreText setText:@"Score"];
        [_scoreContainer addSubview:scoreText];
        
        _gameScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [_scoreContainer frame].size.width, 20)];
        [_gameScoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_gameScoreLabel setTextColor:[UIColor whiteColor]];
        [_gameScoreLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]];
        [_gameScoreLabel setText:@"0"];
        [_scoreContainer addSubview:_gameScoreLabel];
        
        [self stepDownTimer];
    }
    
    return self;
}

- (void)stepUpGameScore {
    
    _gameScore++;
    [_gameScoreLabel setText:[NSString stringWithFormat:@"%ld", (long)_gameScore]];
}

- (void)setGameScore:(NSInteger)score {
    
    _gameScore = score;
    [_gameScoreLabel setText:[NSString stringWithFormat:@"%ld", (long)_gameScore]];
}

- (void)animateTimerAway {
    [UIView animateWithDuration:0.5f animations:^{
        [_timerContainer setAlpha:0];
    }];
}

- (void)animateScoreIn {
    
    [UIView animateWithDuration:0.5f animations:^{
        [_scoreContainer setAlpha:1];
    }];
}

- (void)stepDownTimer {
    
    [_timerLabel setText:[NSString stringWithFormat:@"%ld", (long)_timerInterval--]];
    
    if (_timerInterval > 0) {
        [self performSelector:@selector(stepDownTimer)  withObject:nil afterDelay:1];
    }
    else {
        
        [self performSelector:@selector(animateTimerAway) withObject:nil afterDelay:1];
        [self animateScoreIn];
    }
}

@end
