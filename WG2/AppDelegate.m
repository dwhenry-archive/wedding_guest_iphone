//
//  AppDelegate.m
//  WG2
//
//  Created by David Henry on 28/08/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "Login.h"
@implementation AppDelegate

@synthesize authToken = _authToken;
@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize host = _host;
NSMutableArray *views;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    self.host = @"http://localhost:3000";
    views = [NSMutableArray arrayWithCapacity:6];
    
    [NSTimer scheduledTimerWithTimeInterval:0.33 
                                     target:self 
                                   selector:@selector(gameLoop) 
                                   userInfo:nil repeats:NO];
    
    [self doStateChange:[Login class]];
    return YES;
}
-(void) gameLoop
{
    [self Render];

    [NSTimer scheduledTimerWithTimeInterval:0.33 
                                     target:self 
                                   selector:@selector(gameLoop) 
                                   userInfo:nil repeats:NO];
}
-(void) Render
{
    [((AppState*)self.viewController.view) Update];
    [((AppState*)self.viewController.view) Render];

}
-(void) doStateChange:(id)state
{
    // Override point for customization after application launch.
    if(self.viewController.view != nil) {
        [views addObject:(id)self.viewController.view];
        [self.viewController.view removeFromSuperview];
    }
    self.viewController.view = [[state alloc] 
                                initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT) 
                                andManager: self];
    [self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)previousView
{
    [self.viewController.view removeFromSuperview];
    id previousView = [views lastObject];
    self.viewController.view = (AppState*)previousView;
    [views removeLastObject];
    
    [self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];
}
@end
