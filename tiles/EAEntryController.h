//
//  EAEntryController.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EATileViewController.h"
#import "Tiles.h"
#import "EAMenuButton.h"
#import "EAStatsController.h"

@interface EAEntryController : UIViewController

- (void)startGame:(UIButton *)sender;
- (void)pushToStats;

@end
