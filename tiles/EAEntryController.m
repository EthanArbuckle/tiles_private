//
//  EAEntryController.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAEntryController.h"

@implementation EAEntryController

- (id)init {
    
    if ((self = [super init])) {
        
        [[self view] setBackgroundColor:[UIColor blackColor]];
        
        UIButton *moderateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [moderateButton setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width / 2, 50)];
        [moderateButton setBackgroundColor:[UIColor blueColor]];
        [moderateButton setTitle:@"Play" forState:UIControlStateNormal];
        [moderateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [moderateButton setCenter:[[self view] center]];
        [moderateButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
        [[self view] addSubview:moderateButton];
        
    }
    
    return self;
}

- (void)startGame:(UIButton *)sender {
    
    EATileViewController *gameController = [[EATileViewController alloc] initWithScore:0];
    [gameController setNumberOfX:tilesColumnCount];
    [gameController setNumberOfY:tilesRowCount];
    [gameController setNumberOfGameTiles:tilesStartingCardsCount];
    [gameController layoutTilesOnContainer];
    
    UINavigationController *currentGameNavController = [[UINavigationController alloc] initWithRootViewController:gameController];
    [[currentGameNavController navigationBar] setHidden:YES];
    [[currentGameNavController interactivePopGestureRecognizer] setEnabled:NO];
    
    [self presentViewController:currentGameNavController animated:YES completion:nil];
    
}

@end
