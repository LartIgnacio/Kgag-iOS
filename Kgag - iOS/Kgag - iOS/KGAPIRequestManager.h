//
//  KGAPIRequestManager.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KGURLConnectManager.h"

@interface KGAPIRequestManager : NSObject

- (void)apiRequestWithURL:(NSString *)urlString
            requestParams:(NSDictionary *)requestParams
               requestTag:(NSInteger)tag
            finishedBlock:(RequestFinishedBlock)finishedBlock
               errorBlock:(RequestErrorBlock)errorBlock
              cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)apiPostRequestWithURL:(NSString *)urlString
                requestParams:(NSDictionary *)requestParams
                   requestTag:(NSInteger)tag
                finishedBlock:(RequestFinishedBlock)finishedBlock
                   errorBlock:(RequestErrorBlock)errorBlock
                  cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)apiPostMultiPartRequestWithURL:(NSString *)urlString
                         requestParams:(NSDictionary *)requestParams
                       imageDictionary:(NSDictionary *)imageDictionary
                            requestTag:(NSInteger)tag
                         finishedBlock:(RequestFinishedBlock)finishedBlock
                            errorBlock:(RequestErrorBlock)errorBlock
                           cancelBlock:(RequestCancelBlock)cancelBlock;

@end
