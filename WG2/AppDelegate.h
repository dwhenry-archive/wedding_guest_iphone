//
//  AppDelegate.h
//  WG2
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppStateManager.h"
@class ViewController;

//@interface AppDelegate : UIResponder <UIApplicationDelegate>
@interface AppDelegate : AppStateManager <UIApplicationDelegate> {
    NSString* authToken;
    NSString* host;
    ViewController *viewController;
}

@property  NSString *authToken;
@property  NSString *host;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
-(void)previousView;
@end
