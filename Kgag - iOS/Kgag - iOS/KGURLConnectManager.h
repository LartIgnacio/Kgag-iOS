//
//  KGURLConnectManager.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestFinishedBlock)(NSDictionary *params);
typedef void (^RequestErrorBlock)(NSError *error, NSDictionary *params);
typedef void (^RequestCancelBlock)(void);

@interface KGURLConnectManager : NSObject

+ (KGURLConnectManager *)sharedManager;

- (void)apiGetRequestWithURLPath:(NSString *)urlPath
                      parameters:(NSDictionary *)parameters
                   finishedBlock:(RequestFinishedBlock)finishedBlock
                      errorBlock:(RequestErrorBlock)errorBlock
                     cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)apiPostRequestWithURLPath:(NSString *)urlPath
                       parameters:(NSDictionary *)parameters
                    finishedBlock:(RequestFinishedBlock)finishedBlock
                       errorBlock:(RequestErrorBlock)errorBlock
                      cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)apiPostMultiPartRequestWithURLPath:(NSString *)urlPath
                                parameters:(NSDictionary *)parameters
                           imageDictionary:(NSDictionary *)imageDictionary
                             finishedBlock:(RequestFinishedBlock)finishedBlock
                                errorBlock:(RequestErrorBlock)errorBlock
                               cancelBlock:(RequestCancelBlock)cancelBlock;

@end
