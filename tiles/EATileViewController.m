//
//  EATileViewController.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EATileViewController.h"

@implementation EATileViewController

- (id)initWithScore:(NSInteger)startingScore {

    if ((self = [super init])) {
        
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.93 green:0.95 blue:0.95 alpha:1.0]];
        
        _currentlyActive = NO;
        
        _tileContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 116, [[self view] frame].size.width, [[self view] frame].size.height - 100)];
        [_tileContainer setBackgroundColor:[UIColor whiteColor]];
        
        [[self view] addSubview:_tileContainer];
        
        _gameScoreView = [[EAGameOverview alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100)];
        [_gameScoreView setGameScore:startingScore];
        [[self view] addSubview:_gameScoreView];
}
    
    return self;
}

- (void)layoutTilesOnContainer {
    
    if ([[_tileContainer subviews] count] > 0) {
        
        [[_tileContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    _gameTiles = [[NSMutableArray alloc] initWithCapacity:_numberOfY * _numberOfX];
    
    CGFloat yOrigin = 0;
    
    for (int yIndex = 0; yIndex < _numberOfY; yIndex++) {
        
        CGFloat xOrigin = 0;
        
        for (int xIndex = 0; xIndex < _numberOfX; xIndex++) {
            
            EATile *currentTile = [[EATile alloc] initWithFrame:CGRectMake(xOrigin, yOrigin, ([[self view] frame].size.width / _numberOfX), (([[self view] frame].size.height - 100) / _numberOfY) - 2)];
            [currentTile setDelegate:self];
            [_tileContainer addSubview:currentTile];
            
            [_gameTiles addObject:currentTile];
            
            xOrigin += ([[self view] frame].size.width / _numberOfX);
        }

        yOrigin += ([[self view] frame].size.height - 116) / _numberOfY;
    }
    
    for (int gameCardsChosen = 1; gameCardsChosen <= _numberOfGameTiles; gameCardsChosen++) {
        
        int randomIndex = arc4random() % [_gameTiles count];
        EATile *chosenCard = _gameTiles[randomIndex];
        [_gameTiles removeObjectAtIndex:randomIndex];
        
        [chosenCard setActiveCardWithNumber:gameCardsChosen];
        
    }
    
    _expectedNumber = 1;

}

- (void)gameStarted {
    
    _currentlyActive = YES;
}

- (void)didTapGameTile:(EATile *)tile {

    if (_currentlyActive) {
        
        if (![tile isGameTile] || [tile tileNumber] != _expectedNumber) {
            
            _currentlyActive = NO;
            [[_tileContainer subviews] makeObjectsPerformSelector:@selector(triggerLost)];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self endGame];
            });

            return;
        }
        
        [tile setIsInHiddenState:NO];
        
        if (++_expectedNumber > _numberOfGameTiles) {

            _currentlyActive = NO;
            

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                EATileViewController *gameController = [[EATileViewController alloc] initWithScore:[_gameScoreView gameScore] + 1];
                [gameController setNumberOfX:_numberOfX];
                [gameController setNumberOfY:_numberOfY];
                
                if ((([_gameScoreView gameScore] + 1 ) % tilesAddCardInterval) == 0 && (_numberOfGameTiles + 1) <= (_numberOfY * _numberOfX)) {
                    
                    [gameController setNumberOfGameTiles:_numberOfGameTiles + 1];
                }
                else {
                    
                    [gameController setNumberOfGameTiles:_numberOfGameTiles];
                }
                
                [gameController layoutTilesOnContainer];
                
                [[self navigationController] pushViewController:gameController animated:YES];
                
            });
            
            return;
        }
        
    }
    
}

- (void)endGame {
     [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
