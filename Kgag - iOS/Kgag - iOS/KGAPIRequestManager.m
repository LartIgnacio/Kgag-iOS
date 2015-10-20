//
//  KGAPIRequestManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGAPIRequestManager.h"

@implementation KGAPIRequestManager

- (void)apiRequestWithURL:(NSString *)urlString
            requestParams:(NSDictionary *)requestParams
               requestTag:(NSInteger)tag
            finishedBlock:(RequestFinishedBlock)finishedBlock
               errorBlock:(RequestErrorBlock)errorBlock
              cancelBlock:(RequestCancelBlock)cancelBlock
{
    [[KGURLConnectManager sharedManager] apiGetRequestWithURLPath:urlString
                                                       parameters:requestParams
                                                    finishedBlock:^(NSDictionary *params) {
                                                        finishedBlock(params);
                                                    } errorBlock:^(NSError *error, NSDictionary *params) {
                                                        
                                                    } cancelBlock:^{
                                                        
                                                    }];
}

- (void)apiPostRequestWithURL:(NSString *)urlString
                requestParams:(NSDictionary *)requestParams
                   requestTag:(NSInteger)tag
                finishedBlock:(RequestFinishedBlock)finishedBlock
                   errorBlock:(RequestErrorBlock)errorBlock
                  cancelBlock:(RequestCancelBlock)cancelBlock
{
    
    [[KGURLConnectManager sharedManager] apiPostRequestWithURLPath:urlString
                                                        parameters:requestParams
                                                     finishedBlock:^(NSDictionary *params) {
                                                         finishedBlock(params);
                                                     } errorBlock:^(NSError *error, NSDictionary *params) {
                                                         
                                                     } cancelBlock:^{
                                                         
                                                     }];
}

- (void)apiPostMultiPartRequestWithURL:(NSString *)urlString
                         requestParams:(NSDictionary *)requestParams
                       imageDictionary:(NSDictionary *)imageDictionary
                            requestTag:(NSInteger)tag
                         finishedBlock:(RequestFinishedBlock)finishedBlock
                            errorBlock:(RequestErrorBlock)errorBlock
                           cancelBlock:(RequestCancelBlock)cancelBlock
{
    
    [[KGURLConnectManager sharedManager] apiPostMultiPartRequestWithURLPath:urlString
                                                                 parameters:requestParams
                                                            imageDictionary:imageDictionary
                                                              finishedBlock:^(NSDictionary *params) {
                                                                  finishedBlock(params);
                                                              } errorBlock:^(NSError *error, NSDictionary *params) {
                                                                  
                                                              } cancelBlock:^{
                                                                  
                                                              }];
}
@end
