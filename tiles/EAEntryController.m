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
        
        [[self view] setBackgroundColor:tilesEntryControllerBackgroundColor];
        
        UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 50, [[UIScreen mainScreen] bounds].size.width - 120, 100)];
        [headerImageView setImage:[UIImage imageNamed:@"Header.png"]];
        [headerImageView setContentMode:UIViewContentModeScaleToFill];
        [[headerImageView layer] setShadowRadius:4];
        [[headerImageView layer] setShadowOffset:CGSizeMake(0, 3)];
        [[headerImageView layer] setShadowOpacity:0.5];
        [[headerImageView layer] setShadowPath:[[UIBezierPath bezierPathWithRect:[headerImageView bounds]] CGPath]];
        [[headerImageView layer] setShadowColor:[tileSelectedBackgroundColor CGColor]];
        [[self view] addSubview:headerImageView];
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, [[UIScreen mainScreen] bounds].size.width, 20)];
        [headerLabel setFont:[UIFont fontWithName:@".SFUIText-Regular" size:16]];
        [headerLabel setText:@"a memory game"];
        [headerLabel setTextAlignment:NSTextAlignmentCenter];
        [headerLabel setTextColor:tilesHeaderLabelTextColor];
        [[self view] addSubview:headerLabel];
        
        EAMenuButton *playButton = [[EAMenuButton alloc] initWithImage:[UIImage imageNamed:@"Play.png"] andTitle:@"Play"];
        [playButton setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width / 2) - (160 / 2), 205, 160, 55)];
        [playButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
        [[self view] addSubview:playButton];
        
        EAMenuButton *statsButton = [[EAMenuButton alloc] initWithImage:[UIImage imageNamed:@"Stats.png"] andTitle:@"Stats"];
        [statsButton setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width / 2) - (160 / 2), [playButton frame].origin.y + [playButton frame].size.height + 20, 160, 55)];
        [statsButton addTarget:self action:@selector(pushToStats) forControlEvents:UIControlEventTouchUpInside];
        [[self view] addSubview:statsButton];
        
        EAMenuButton *optionsButton = [[EAMenuButton alloc] initWithImage:[UIImage imageNamed:@"Options (Cell).png"] andTitle:@"  Options"];
        [optionsButton setFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width / 2) - (160 / 2), [statsButton frame].origin.y + [statsButton frame].size.height + 20, 160, 55)];
        CGRect imageFrame = [[optionsButton cellImage] frame];
        imageFrame.origin.x -= 10;
        [[optionsButton cellImage] setFrame:imageFrame];
        [[self view] addSubview:optionsButton];
        
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

- (void)pushToStats {
    
    [[self navigationController] pushViewController:[EAStatsController new] animated:YES];
    
}

@end
