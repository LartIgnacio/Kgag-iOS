//
//  KGUserRequestManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGUserRequestManager.h"

@implementation KGUserRequestManager

- (void)requestUserDetails:(NSString *)userName
             finishedBlock:(RequestFinishedBlock)finishedBlock
                errorBlock:(RequestErrorBlock)errorBlock
               cancelBlock:(RequestCancelBlock)cancelBlock
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        finishedBlock(params);
    };
    
    NSString *urlPath = [NSString stringWithFormat:urlViewUser, userName];
    
    [self apiRequestWithURL:urlPath
              requestParams:nil
                 requestTag:0
              finishedBlock:requestFinishedBlock
                 errorBlock:errorBlock
                cancelBlock:cancelBlock];
}

- (void)requestVerifyCredentials:(NSString *)userName
                        password:(NSString *)password
                   finishedBlock:(RequestFinishedBlock)finishedBlock
                      errorBlock:(RequestErrorBlock)errorBlock
                     cancelBlock:(RequestCancelBlock)cancelBlock
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        finishedBlock(params);
    };
    
    NSDictionary *userParameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                    userName, @"username",
                                    password, @"password", nil];
    
    NSDictionary *requestParameteres = [NSDictionary dictionaryWithObject:userParameters forKey:@"User"];
    
    [self apiPostRequestWithURL:urlVerifyUser
                  requestParams:requestParameteres
                     requestTag:0
                  finishedBlock:requestFinishedBlock
                     errorBlock:errorBlock
                    cancelBlock:cancelBlock];
}

- (void)requestAddUser:(KGUser *)user
         finishedBlock:(RequestFinishedBlock)finishedBlock
            errorBlock:(RequestErrorBlock)errorBlock
           cancelBlock:(RequestCancelBlock)cancelBlock
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        finishedBlock(params);
    };
    
    NSDictionary *userDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    user.userName, @"username",
                                    user.password, @"password",
                                    user.firstName, @"first_name",
                                    user.lastName, @"last_name", nil];
    
    NSDictionary *requestParams = [NSDictionary dictionaryWithObject:userDictionary forKey:@"User"];
    
    [self apiPostRequestWithURL:urlAddUser
                  requestParams:requestParams
                     requestTag:0
                  finishedBlock:requestFinishedBlock
                     errorBlock:errorBlock
                    cancelBlock:cancelBlock];
}

@end
