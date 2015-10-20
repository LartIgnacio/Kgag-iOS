//
//  KGUserRequestManager.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KGAPIRequestManager.h"
#import "KGURLPath.h"
#import "KGUser.h"

@interface KGUserRequestManager : KGAPIRequestManager

- (void)requestUserDetails:(NSString *)userName
             finishedBlock:(RequestFinishedBlock)finishedBlock
                errorBlock:(RequestErrorBlock)errorBlock
               cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)requestVerifyCredentials:(NSString *)userName
                        password:(NSString *)password
                   finishedBlock:(RequestFinishedBlock)finishedBlock
                      errorBlock:(RequestErrorBlock)errorBlock
                     cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)requestAddUser:(KGUser *)user
         finishedBlock:(RequestFinishedBlock)finishedBlock
            errorBlock:(RequestErrorBlock)errorBlock
           cancelBlock:(RequestCancelBlock)cancelBlock;

@end
