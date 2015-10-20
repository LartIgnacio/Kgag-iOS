//
//  AppDelegate.m
//  Kgag - iOS
//
//  Created by Lart Ace Ignacio on 19/10/2015.
//  Copyright © 2015 L Company. All rights reserved.
//

#import "AppDelegate.h"
#import "KGLoginViewController.h"

static NSString *KKGMainStoryBoard  = @"Main";
static NSString *KKGLoginStoryBoard = @"login";

//#define KKGMainStoryBoard   "Main"
//#define KKGLoginStoryBoard  "login"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    if ([self hasAccount])
        [self showMainStoryBoard];
    else
        [self showLoginStoryBoard];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SwitchingStoryBoards
- (void)showLoginStoryBoard
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:KKGLoginStoryBoard
                                                             bundle:nil];
    
    UINavigationController *navigationController = [mainStoryboard instantiateViewControllerWithIdentifier:@"loginNavigationController"];
    
    [self setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
}

- (void)showMainStoryBoard
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:KKGMainStoryBoard
                                                             bundle:nil];
    
    UITabBarController *tabBarController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    [self setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
}

- (void)setRootViewController:(id)viewController
{
    [UIView transitionWithView:self.window
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{ self.window.rootViewController = viewController; }
                    completion:nil];
}

#pragma mark - UserDefaults
- (BOOL)hasAccount
{
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    
    return (userName.length > 0) ? YES : NO;
}

- (void)setApplicationAccount:(NSString *)userName
{
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
}

- (NSString *)applicationUserName
{
    return  [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
}

@end
