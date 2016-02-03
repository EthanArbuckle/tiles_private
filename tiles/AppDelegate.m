//
//  AppDelegate.m
//  tiles
//
//  Created by Ethan Arbuckle on 2/1/16.
//  Copyright © 2016 Ethan Arbuckle. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[EAEntryController new]];
    [[navController navigationBar] setHidden:YES];
    [_window setRootViewController:navController];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
