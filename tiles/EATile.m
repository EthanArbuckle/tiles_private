//
//  EATile.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EATile.h"

@implementation EATile

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        
        _triggered = YES;
        
        [self setBackgroundColor:tileNormalBackgroundColor];
        
        [[self layer] setBorderColor:[tileBorderColor CGColor]];
        [[self layer] setBorderWidth:1];
        
        [self setClipsToBounds:NO];
        
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ([self frame].size.height / 2) - 10, [self frame].size.width, 30)];
        [_numberLabel setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:30]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [_numberLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_numberLabel];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(tilesCountdownTimerLength * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
            [self setIsInHiddenState:YES];
            [_delegate gameStarted];
        });
    }
    
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (!_triggered) {
        
        _triggered = YES;
        
        [[self layer] setZPosition:5];
        [[self layer] setShadowRadius:7];
        [[self layer] setShadowOffset:CGSizeMake(0, 4)];
        [[self layer] setShadowOpacity:0.9];
        [[self layer] setShadowPath:[[UIBezierPath bezierPathWithRect:[self bounds]] CGPath]];
        [[self layer] setShadowColor:[UIColor colorWithRed:0.75 green:0.82 blue:0.85 alpha:1.0].CGColor];
        
        [_delegate didTapGameTile:self];
    }
    
}

- (void)setActiveCardWithNumber:(NSInteger)cardNumber {

    [self setBackgroundColor:tileSelectedBackgroundColor];
    [_numberLabel setText:[NSString stringWithFormat:@"%ld", (long)cardNumber]];
    
    [self setIsGameTile:YES];
    [self setTileNumber:cardNumber];
    
}

- (void)triggerLost {
    
    [self setIsGameTile:NO];
    [self setTileNumber:0];
    [self setIsInHiddenState:NO];
}

- (void)setIsInHiddenState:(BOOL)hiddenState {
    
    _triggered = !hiddenState;
    [_numberLabel setHidden:hiddenState];
    [self setBackgroundColor:(hiddenState) ? tileNormalBackgroundColor : tileSelectedBackgroundColor];
}

@end
