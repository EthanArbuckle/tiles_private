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
        
        CGFloat labelXOrigin = ([[UIScreen mainScreen] bounds].size.width / 2) - ([self widthOfString:@"You have attempted a total of" withFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]] / 2);
        
        UILabel *staticAttempted = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, 120, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticAttempted setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticAttempted setTextColor:tilesHeaderLabelTextColor];
        [staticAttempted setText:@"You have attempted a total of"];
        [[self view] addSubview:staticAttempted];
        
        UILabel *dynamicAttempted = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticAttempted frame].origin.y + 25, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicAttempted setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicAttempted setTextColor:tilesStatsRedLabelColor];
        [dynamicAttempted setText:[NSString stringWithFormat:@"%ld puzzles.", [[EATileGameStatManager sharedInstance] totalGameAttempts]]];
        [[self view] addSubview:dynamicAttempted];
        
        CGFloat dynamicLength = [self widthOfString:[dynamicAttempted text] withFont:[dynamicAttempted font]];
        UIImageView *puzzlesImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelXOrigin + dynamicLength + 5, [dynamicAttempted frame].origin.y + 5, 20, 20)];
        [puzzlesImage setImage:[UIImage imageNamed:@"Puzzles.png"]];
        [[self view] addSubview:puzzlesImage];
        
        UILabel *staticSolved = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticAttempted frame].origin.y + 70, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticSolved setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticSolved setTextColor:tilesHeaderLabelTextColor];
        [staticSolved setText:@"You have solved a total of"];
        [[self view] addSubview:staticSolved];
        
        UILabel *dynamicSolved = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticSolved frame].origin.y + 25, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicSolved setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicSolved setTextColor:tilesStatsRedLabelColor];
        [dynamicSolved setText:[NSString stringWithFormat:@"%ld puzzles.", [[EATileGameStatManager sharedInstance] totalGamesWon]]];
        [[self view] addSubview:dynamicSolved];
        
        dynamicLength = [self widthOfString:[dynamicSolved text] withFont:[dynamicSolved font]];
        UIImageView *allPuzzlesImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelXOrigin + dynamicLength + 5, [dynamicSolved frame].origin.y + 2, 30, 25)];
        [allPuzzlesImage setImage:[UIImage imageNamed:@"Tick (Solved Puzzles.png"]];
        [[self view] addSubview:allPuzzlesImage];
        
        UILabel *staticHighScore = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticSolved frame].origin.y + 70, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticHighScore setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticHighScore setTextColor:tilesHeaderLabelTextColor];
        [staticHighScore setText:@"Your high score of all time is"];
        [[self view] addSubview:staticHighScore];
        
        UILabel *dynamicHighScore = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticHighScore frame].origin.y + 25, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicHighScore setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicHighScore setTextColor:tilesStatsRedLabelColor];
        [dynamicHighScore setText:[NSString stringWithFormat:@"%ld.", [[EATileGameStatManager sharedInstance] currentHighScore]]];
        [[self view] addSubview:dynamicHighScore];
        
        dynamicLength = [self widthOfString:[dynamicHighScore text] withFont:[dynamicHighScore font]];
        UIImageView *highScoreImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelXOrigin + dynamicLength + 5, [dynamicHighScore frame].origin.y + 5, 20, 20)];
        [highScoreImage setImage:[UIImage imageNamed:@"High Score.png"]];
        [[self view] addSubview:highScoreImage];
        
        UILabel *staticFastestTime = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticHighScore frame].origin.y + 70, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticFastestTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticFastestTime setTextColor:tilesHeaderLabelTextColor];
        [staticFastestTime setText:@"Your fastest solving time was"];
        [[self view] addSubview:staticFastestTime];
        
        UILabel *dynamicFastestTime = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticFastestTime frame].origin.y + 25, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicFastestTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicFastestTime setTextColor:tilesStatsRedLabelColor];
        [dynamicFastestTime setText:[NSString stringWithFormat:@"%ld seconds.", [[EATileGameStatManager sharedInstance] fastestGame]]];
        [[self view] addSubview:dynamicFastestTime];
        
        dynamicLength = [self widthOfString:[dynamicFastestTime text] withFont:[dynamicFastestTime font]];
        UIImageView *fastestImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelXOrigin + dynamicLength + 5, [dynamicFastestTime frame].origin.y + 5, 20, 20)];
        [fastestImage setImage:[UIImage imageNamed:@"Fastest Time.png"]];
        [[self view] addSubview:fastestImage];
        
        UILabel *staticTotalTime = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticFastestTime frame].origin.y + 70, [[UIScreen mainScreen] bounds].size.width, 25)];
        [staticTotalTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:16]];
        [staticTotalTime setTextColor:tilesHeaderLabelTextColor];
        [staticTotalTime setText:@"You have played a total of"];
        [[self view] addSubview:staticTotalTime];
        
        UILabel *dynamicTotalTime = [[UILabel alloc] initWithFrame:CGRectMake(labelXOrigin, [staticTotalTime frame].origin.y + 25, [[UIScreen mainScreen] bounds].size.width, 30)];
        [dynamicTotalTime setFont:[UIFont fontWithName:@".SFUIText-Heavy" size:26]];
        [dynamicTotalTime setTextColor:tilesStatsRedLabelColor];
        [dynamicTotalTime setText:[NSString stringWithFormat:@"%ld seconds.", [[EATileGameStatManager sharedInstance] totalTimeInGame]]];
        [[self view] addSubview:dynamicTotalTime];
        
        dynamicLength = [self widthOfString:[dynamicTotalTime text] withFont:[dynamicTotalTime font]];
        UIImageView *totalTimeImage = [[UIImageView alloc] initWithFrame:CGRectMake(labelXOrigin + dynamicLength + 5, [dynamicTotalTime frame].origin.y + 5, 20, 20)];
        [totalTimeImage setImage:[UIImage imageNamed:@"Time.png"]];
        [[self view] addSubview:totalTimeImage];
        
    }
    
    return self;
}

- (CGFloat)widthOfString:(NSString *)string withFont:(UIFont *)font {
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

@end
