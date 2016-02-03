//
//  EAMenuButton.h
//  tiles
//
//  Created by Ethan Arbuckle on 2/3/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tiles.h"

@interface EAMenuButton : UIButton

@property (nonatomic, retain) UIImageView *cellImage;

- (id)initWithImage:(UIImage *)image andTitle:(NSString *)title;

@end
