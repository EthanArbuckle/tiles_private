//
//  EAMenuButton.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "EAMenuButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation EAMenuButton

-(void)setupView{
    
    self.layer.shadowColor = [tilesEntryButtonsBackgroundColor CGColor];
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 4;
    self.layer.shadowOffset = CGSizeMake(0,3);
    
}

-(id)initWithFrame:(CGRect)frame{
    if((self = [super initWithFrame:frame])){
        [self setupView];
    }
    
    return self;
}

@end
