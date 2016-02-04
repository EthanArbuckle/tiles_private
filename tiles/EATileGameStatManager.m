//
//  EATileGameStatManager.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EATileGameStatManager.h"

@implementation EATileGameStatManager

+ (id)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init {
    
    if ((self = [super init])) {
        
        _isInGame = NO;
        _gameLength = 0;
        
        _currentHighScore = [self getValueForKey:@"tilesHighScore"];
        _totalTimeInGame = [self getValueForKey:@"tilesTotalGameTime"];
        _totalGameAttempts = [self getValueForKey:@"tilesTotalGameAttempts"];
        _totalGamesWon = [self getValueForKey:@"tilesTotalGameWins"];
        _fastestGame = [self getValueForKey:@"tilesFastestGame"];
        
    }
    
    return self;
}

- (void)gameStarting {

    if (_isInGame) {

        [_gameTimer invalidate];
    }
    
    _isInGame = YES;
    _gameLength = 0;
    _gameTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(stepUpTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_gameTimer forMode:NSDefaultRunLoopMode];
}

- (void)gameStopping {
    
    if (_isInGame) {
        
        [_gameTimer invalidate];
        _isInGame = NO;
        
        NSLog(@"game length: %ld", (long)_gameLength);
        
        if (_gameLength < _fastestGame || ((_gameLength > 0) && _fastestGame == 0)) {
            _fastestGame = _gameLength;
            [self saveNumber:_gameLength forKey:@"tilesFastestGame"];
        }
        _gameLength = 0;
    }
    
}

- (void)stepUpTimer {
    
    if (_isInGame) {
        _gameLength++;
    }
}

- (CGFloat)getValueForKey:(NSString *)key {
    
    if (![[NSUserDefaults standardUserDefaults] valueForKey:key]) {
        
        return 0;
    }
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

- (void)saveNumber:(NSInteger)save forKey:(NSString *)key {
    
    [[NSUserDefaults standardUserDefaults] setInteger:save forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)stepUpGameAttempts {
    
    [self saveNumber:++_totalGameAttempts forKey:@"tilesTotalGameAttempts"];
}

- (void)stepUpGameWins {
    
    [self saveNumber:++_totalGamesWon forKey:@"tilesTotalGameWins"];
}

@end
