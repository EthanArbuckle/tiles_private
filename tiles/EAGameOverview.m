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
        
        [self setBackgroundColor:tilesHeaderBackgroundColor];
        
        _gameScore = 0;
        _timerInterval = tilesCountdownTimerLength;
        
        _scoreContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 50)];
        [_scoreContainer setBackgroundColor:scoreContainerBackgroundColor];
        [_scoreContainer setCenter:[self center]];
        [_scoreContainer setFrame:CGRectMake([_scoreContainer frame].origin.x, 35, 75, 50)];
        [_scoreContainer setAlpha:0];
        [[_scoreContainer layer] setShadowRadius:6];
        [[_scoreContainer layer] setShadowOffset:CGSizeMake(0, 3)];
        [[_scoreContainer layer] setShadowOpacity:0.5];
        [[_scoreContainer layer] setShadowPath:[[UIBezierPath bezierPathWithRect:[_scoreContainer bounds]] CGPath]];
        [[_scoreContainer layer] setShadowColor:[scoreContainerBackgroundColor CGColor]];
        [self addSubview:_scoreContainer];
        
        _timerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 75, 50)];
        [_timerContainer setBackgroundColor:scoreContainerBackgroundColor];
        [_timerContainer setCenter:[self center]];
        [_timerContainer setFrame:CGRectMake([_timerContainer frame].origin.x, 35, 75, 50)];
        [[_timerContainer layer] setShadowRadius:6];
        [[_timerContainer layer] setShadowOffset:CGSizeMake(0, 3)];
        [[_timerContainer layer] setShadowOpacity:0.5];
        [[_timerContainer layer] setShadowPath:[[UIBezierPath bezierPathWithRect:[_timerContainer bounds]] CGPath]];
        [[_timerContainer layer] setShadowColor:[scoreContainerBackgroundColor CGColor]];
        [self addSubview:_timerContainer];
        
        _timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, [_timerContainer frame].size.width, 20)];
        [_timerLabel setTextAlignment:NSTextAlignmentCenter];
        [_timerLabel setTextColor:[UIColor whiteColor]];
        [_timerLabel setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [_timerLabel setText:[NSString stringWithFormat:@"%ld", (long)_timerInterval]];
        [_timerContainer addSubview:_timerLabel];
        
        UILabel *scoreText = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, [_scoreContainer frame].size.width, 10)];
        [scoreText setTextColor:[UIColor whiteColor]];
        [scoreText setFont:[UIFont fontWithName:@".SFUIText-Bold" size:12]];
        [scoreText setTextAlignment:NSTextAlignmentCenter];
        [scoreText setText:@"SCORE"];
        [_scoreContainer addSubview:scoreText];
        
        _gameScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [_scoreContainer frame].size.width, 20)];
        [_gameScoreLabel setTextAlignment:NSTextAlignmentCenter];
        [_gameScoreLabel setTextColor:[UIColor whiteColor]];
        [_gameScoreLabel setFont:[UIFont fontWithName:@".SFUIText-Bold" size:25]];
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
