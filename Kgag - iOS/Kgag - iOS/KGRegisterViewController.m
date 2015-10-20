//
//  KGRegisterViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGRegisterViewController.h"
#import "AppDelegate.h"
#import "KGUserRequestManager.h"
#import "KGUser.h"

@interface KGRegisterViewController ()

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation KGRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - IBActions
- (IBAction)registerButtonAction:(id)sender
{
    if ([self isEntryFieldsValid])
    {
        [self requestRegisterUser];
        return;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                             message:@"Please complete all the fields"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - API Request
- (void)requestRegisterUser
{
    RequestFinishedBlock finishedBlock = ^(NSDictionary *params) {
        
        BOOL isExisting = [[params objectForKey:@"is_existing"] boolValue];
        if (isExisting)
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Failed"
                                                                                     message:@"Username already exist"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
        
        NSDictionary *userDictionary = [params objectForKey:@"User"];
        
        KGUser *user = [[KGUser alloc] initWithDictionary:userDictionary];
        
        [AppDelegate sharedAppDelegate].user = user;
        [[AppDelegate sharedAppDelegate] setApplicationAccount:user.userName];
        
        [[AppDelegate sharedAppDelegate] showMainStoryBoard];
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];
    
    KGUser *user = [[KGUser alloc] init];
    user.userName = [self trimmedString:self.userNameTextField.text];
    user.password = [self trimmedString:self.passwordTextField.text];
    user.firstName = [self trimmedString:self.firstNameTextField.text];
    user.lastName = [self trimmedString:self.lastNameTextField.text];
    
    [userManager requestAddUser:user
                  finishedBlock:finishedBlock
                     errorBlock:errorBlock
                    cancelBlock:cancelBlock];
}

#pragma mark - Utilities
- (BOOL)isEntryFieldsValid
{
    NSString *userName = [self trimmedString:self.userNameTextField.text];
    NSString *password = [self trimmedString:self.passwordTextField.text];
    NSString *firstName = [self trimmedString:self.firstNameTextField.text];
    NSString *lastName = [self trimmedString:self.lastNameTextField.text];
    
    BOOL isFieldsComplete = (userName.length > 0) && (password.length > 0) && (firstName.length > 0) && (lastName.length > 0);
    
    return isFieldsComplete;
}

- (NSString *)trimmedString:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
