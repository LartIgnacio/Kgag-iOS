//
//  AppDelegate.h
//  Kgag - iOS
//
//  Created by Lart Ace Ignacio on 19/10/2015.
//  Copyright © 2015 L Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGUser.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) KGUser *user;

+ (AppDelegate *)sharedAppDelegate;

- (void)setApplicationAccount:(NSString *)userName;
- (NSString *)applicationUserName;

- (void)showLoginStoryBoard;
- (void)showMainStoryBoard;

@end

