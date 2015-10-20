//
//  KGLoginViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGLoginViewController.h"
#import "AppDelegate.h"
#import "KGUserRequestManager.h"

@interface KGLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation KGLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)loginButtonAction:(id)sender
{
    if (self.userNameTextField.text.length > 0 && self.passwordTextField.text.length > 0)
        [self requestUserCredentials];
}

#pragma mark - API Request
- (void)requestUserCredentials
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        
        NSDictionary *dataDictionary = [params objectForKey:@"data"];
        BOOL isValid = [[dataDictionary objectForKey:@"is_credentials_valid"] boolValue];
        
        if (isValid) {
            NSDictionary *userDictionary = [dataDictionary objectForKey:@"User"];
            KGUser *user = [[KGUser alloc] initWithDictionary:userDictionary];
            [AppDelegate sharedAppDelegate].user = user;
            
            [[AppDelegate sharedAppDelegate] setApplicationAccount:user.userName];
            [[AppDelegate sharedAppDelegate] showMainStoryBoard];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login Failed"
                                                                                     message:@"Username or password is incorrect"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            
            [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];

    [userManager requestVerifyCredentials:self.userNameTextField.text
                                 password:self.passwordTextField.text
                            finishedBlock:requestFinishedBlock
                               errorBlock:errorBlock
                              cancelBlock:cancelBlock];
}

@end
