//
//  EAMenuButton.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAMenuButton.h"

@implementation EAMenuButton

- (id)initWithImage:(UIImage *)image andTitle:(NSString *)title {
    
    if ((self = [super init])) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [[self titleLabel] setFont:[UIFont fontWithName:@".SFUIText-Bold" size:25]];
        
        [self setBackgroundColor:tilesEntryButtonsBackgroundColor];
        [[self layer] setShadowRadius:4];
        [[self layer] setShadowOffset:CGSizeMake(0, 3)];
        [[self layer] setShadowOpacity:0.5];
        [[self layer] setShadowColor:[tilesEntryButtonsBackgroundColor CGColor]];
        
        _cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, (55 / 2) - 10, 20, 20)];
        [_cellImage setImage:image];
        [self addSubview:_cellImage];
    }
    
    return self;
}

@end
