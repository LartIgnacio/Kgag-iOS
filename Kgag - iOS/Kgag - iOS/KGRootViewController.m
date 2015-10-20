//
//  KGRootViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGRootViewController.h"
#import "AppDelegate.h"
#import "KGUserRequestManager.h"

@interface KGRootViewController ()

@end

@implementation KGRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self requestUserCredentials];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnLogoutAction:(id)sender
{
    [[AppDelegate sharedAppDelegate] setApplicationAccount:nil];
    [[AppDelegate sharedAppDelegate] showLoginStoryBoard];
}


#pragma mark - API Request
- (void)requestUserCredentials
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        NSDictionary *userDictionary = [[params objectForKey:@"data"] objectForKey:@"User"];
        
        if (userDictionary.count > 0)
        {
            KGUser *user = [[KGUser alloc] initWithDictionary:userDictionary];
            [AppDelegate sharedAppDelegate].user = user;
            [[AppDelegate sharedAppDelegate] setApplicationAccount:user.userName];
        }
        else
        {
            [[AppDelegate sharedAppDelegate] setApplicationAccount:nil];
            [[AppDelegate sharedAppDelegate] showLoginStoryBoard];
        }
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];
    
    [userManager requestUserDetails:[AppDelegate sharedAppDelegate].applicationUserName
                      finishedBlock:requestFinishedBlock
                         errorBlock:errorBlock
                        cancelBlock:cancelBlock];
}

@end
