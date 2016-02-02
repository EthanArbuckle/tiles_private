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
        
        [self setBackgroundColor:[UIColor colorWithRed:0.961 green:0.969 blue:0.996 alpha:1.00]];
        
        [[self layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[self layer] setBorderWidth:0.5];
        
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, ([self frame].size.height / 2) - 10, [self frame].size.width, 20)];
        [_numberLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
        [_numberLabel setTextAlignment:NSTextAlignmentCenter];
        [_numberLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_numberLabel];
        
    }
    
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_delegate didTapGameTile:self];
    
}

- (void)setActiveCardWithNumber:(NSInteger)cardNumber {

    [self setBackgroundColor:[UIColor colorWithRed:0.698 green:0.784 blue:0.816 alpha:1.00]];
    [_numberLabel setText:[NSString stringWithFormat:@"%ld", (long)cardNumber]];
    
    [self setIsGameTile:YES];
    [self setTileNumber:cardNumber];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setIsInHiddenState:YES];
        [_delegate gameStarted];
    });
}

- (void)triggerLost {
    
    [self setIsGameTile:NO];
    [self setTileNumber:0];
    [self setIsInHiddenState:NO];
}

- (void)setIsInHiddenState:(BOOL)hiddenState {
    
  //  [_numberLabel setHidden:hiddenState];
    [self setBackgroundColor:(hiddenState) ? [UIColor colorWithRed:0.961 green:0.969 blue:0.996 alpha:1.00] : [UIColor colorWithRed:0.698 green:0.784 blue:0.816 alpha:1.00]];
}

@end
