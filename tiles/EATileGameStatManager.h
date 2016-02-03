//
//  EATileGameStatManager.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EATileGameStatManager : NSObject

@property (nonatomic) BOOL isInGame;
@property (nonatomic) NSInteger gameLength;
@property (nonatomic, retain) NSTimer *gameTimer;
@property (nonatomic) NSInteger currentHighScore;
@property (nonatomic) NSInteger totalTimeInGame;
@property (nonatomic) NSInteger totalGameAttempts;
@property (nonatomic) NSInteger totalGamesWon;
@property (nonatomic) CGFloat fastestGame;

+ (id)sharedInstance;
- (void)gameStarting;
- (void)gameStopping;
- (void)stepUpTimer;
- (CGFloat)getValueForKey:(NSString *)key;

@end
