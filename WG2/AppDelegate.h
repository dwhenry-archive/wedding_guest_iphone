//
//  AppDelegate.h
//  WG2
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//
#define IPHONE_WIDTH 320
#define IPHONE_HEIGHT 480

#import <UIKit/UIKit.h>
#import "AppStateManager.h"
@class ViewController;

//@interface AppDelegate : UIResponder <UIApplicationDelegate>
@interface AppDelegate : AppStateManager <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
