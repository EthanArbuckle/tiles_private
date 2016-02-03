//
//  EATileViewController.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EATile.h"
#import "EAGameOverview.h"
#import "Tiles.h"

@interface EATileViewController : UIViewController <EATileDelegate>

@property (nonatomic, retain) UIView *tileContainer;
@property (nonatomic, retain) EAGameOverview *gameScoreView;
@property (nonatomic, retain) NSMutableArray <EATile *> *gameTiles;
@property (nonatomic) NSInteger expectedNumber;
@property (nonatomic) BOOL currentlyActive;

@property (nonatomic) CGFloat numberOfX;
@property (nonatomic) CGFloat numberOfY;
@property (nonatomic) CGFloat numberOfGameTiles;

- (id)initWithScore:(NSInteger)startingScore;
- (void)layoutTilesOnContainer;
- (void)endGame;

@end
