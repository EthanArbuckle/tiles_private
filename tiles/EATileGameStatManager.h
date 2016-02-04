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
@property (nonatomic) NSInteger fastestGame;

+ (id)sharedInstance;
- (void)gameStarting;
- (void)gameStopping;
- (void)stepUpTimer;
- (CGFloat)getValueForKey:(NSString *)key;
- (void)saveNumber:(NSInteger)save forKey:(NSString *)key;
- (void)stepUpGameAttempts;
- (void)stepUpGameWins;

@end
