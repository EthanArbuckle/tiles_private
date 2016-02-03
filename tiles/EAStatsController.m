//
//  EAStatsController.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAStatsController.h"

@implementation EAStatsController

- (id)init {
    
    if ((self = [super init])) {
        
        [[self view] setBackgroundColor:tilesEntryControllerBackgroundColor];
        
        UILabel *staticAttempted = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticAttempted setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticAttempted setTextColor:tilesHeaderLabelTextColor];
        [staticAttempted setText:@"You have attempted a total of"];
        [[self view] addSubview:staticAttempted];
        
        UILabel *dynamicAttempted = [[UILabel alloc] initWithFrame:CGRectMake(50, 125, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicAttempted setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicAttempted setTextColor:tilesStatsRedLabelColor];
        [dynamicAttempted setText:@"3 puzzles."];
        [[self view] addSubview:dynamicAttempted];
        
        CGFloat staticLength = [self widthOfString:[dynamicAttempted text] withFont:[dynamicAttempted font]];
        UIView *test = [[UIView alloc] initWithFrame:CGRectMake(staticLength + 50 + 5, 135, 10, 10)];
        [[self view] addSubview:test];
        [test setBackgroundColor:tilesStatsRedLabelColor];
        
        UILabel *staticSolved = [[UILabel alloc] initWithFrame:CGRectMake(50, 170, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticSolved setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticSolved setTextColor:tilesHeaderLabelTextColor];
        [staticSolved setText:@"You have solved a total of"];
        [[self view] addSubview:staticSolved];
        
        UILabel *dynamicSolved = [[UILabel alloc] initWithFrame:CGRectMake(50, 195, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicSolved setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicSolved setTextColor:tilesStatsRedLabelColor];
        [dynamicSolved setText:@"2 puzzles."];
        [[self view] addSubview:dynamicSolved];
        
        UILabel *staticHighScore = [[UILabel alloc] initWithFrame:CGRectMake(50, 240, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticHighScore setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticHighScore setTextColor:tilesHeaderLabelTextColor];
        [staticHighScore setText:@"Your high score of all time is"];
        [[self view] addSubview:staticHighScore];
        
        UILabel *dynamicHighScore = [[UILabel alloc] initWithFrame:CGRectMake(50, 265, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicHighScore setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicHighScore setTextColor:tilesStatsRedLabelColor];
        [dynamicHighScore setText:@"9."];
        [[self view] addSubview:dynamicHighScore];
        
        UILabel *staticFastestTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 310, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticFastestTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticFastestTime setTextColor:tilesHeaderLabelTextColor];
        [staticFastestTime setText:@"Your fastest solving time was"];
        [[self view] addSubview:staticFastestTime];
        
        UILabel *dynamicFastestTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 335, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicFastestTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicFastestTime setTextColor:tilesStatsRedLabelColor];
        [dynamicFastestTime setText:@"0.7 seconds"];
        [[self view] addSubview:dynamicFastestTime];
        
        UILabel *staticTotalTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 380, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticTotalTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticTotalTime setTextColor:tilesHeaderLabelTextColor];
        [staticTotalTime setText:@"You have played a total of"];
        [[self view] addSubview:staticTotalTime];
        
        UILabel *dynamicTotalTime = [[UILabel alloc] initWithFrame:CGRectMake(50, 405, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicTotalTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicTotalTime setTextColor:tilesStatsRedLabelColor];
        [dynamicTotalTime setText:@"15 minutes"];
        [[self view] addSubview:dynamicTotalTime];
        
    }
    
    return self;
}

- (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font {
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

@end
