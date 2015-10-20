//
//  KGURLConnectManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGURLConnectManager.h"
#import "AFNetworking.h"
#import "KGURLPath.h"

@interface KGURLConnectManager ()
@property (nonatomic, retain) AFHTTPRequestOperationManager *manager;
@end

@implementation KGURLConnectManager

static KGURLConnectManager* sharedManager = nil;

+ (KGURLConnectManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[KGURLConnectManager alloc] init];
    });
    return sharedManager;
}

- (void)apiGetRequestWithURLPath:(NSString *)urlPath
                      parameters:(NSDictionary *)parameters
                   finishedBlock:(RequestFinishedBlock)finishedBlock
                      errorBlock:(RequestErrorBlock)errorBlock
                     cancelBlock:(RequestCancelBlock)cancelBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *serverURL = urlMainPath;
    NSString *requestParameters = [self getRequestParameters:parameters];
    NSString *urlString = [NSString stringWithFormat:@"%@%@?%@", serverURL, urlPath, requestParameters];
    
    NSLog(@"URL : %@", urlString);
    NSLog(@"Parameters : %@", parameters);
    
    [manager GET:urlString
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"STATUS CODE: %ld", (long)operation.response.statusCode);
             
             NSLog(@"Return: %@", responseObject);
             
             finishedBlock(responseObject);
             
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Operation : %@", operation.userInfo);
        NSLog(@"Error: %@", error);
    }];
}

- (void)apiPostRequestWithURLPath:(NSString *)urlPath
                       parameters:(NSDictionary *)parameters
                    finishedBlock:(RequestFinishedBlock)finishedBlock
                       errorBlock:(RequestErrorBlock)errorBlock
                      cancelBlock:(RequestCancelBlock)cancelBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *serverURL = urlMainPath;
    NSString *urlString = [NSString stringWithFormat:@"%@%@", serverURL, urlPath];
    
    NSLog(@"URL : %@", urlString);
    NSLog(@"Parameters : %@", parameters);
    
    [manager POST:urlString
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"STATUS CODE: %ld", (long)operation.response.statusCode);
              NSLog(@"Return: %@", responseObject);
              
              finishedBlock(responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Operation : %@", operation.userInfo);
              NSLog(@"Error: %@", error);
          }];
}

- (void)apiPostMultiPartRequestWithURLPath:(NSString *)urlPath
                                parameters:(NSDictionary *)parameters
                           imageDictionary:(NSDictionary *)imageDictionary
                             finishedBlock:(RequestFinishedBlock)finishedBlock
                                errorBlock:(RequestErrorBlock)errorBlock
                               cancelBlock:(RequestCancelBlock)cancelBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *serverURL = urlMainPath;
    NSString *urlString = [NSString stringWithFormat:@"%@%@", serverURL, urlPath];
    
    NSLog(@"URL : %@", urlString);
    NSLog(@"Parameters : %@", parameters);
    
    [manager POST:urlString
       parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:[imageDictionary objectForKey:@"data"]
                                name:@"photo"
                            fileName:[imageDictionary objectForKey:@"fileName"]
                            mimeType:@"image/jpeg"];
} success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"STATUS CODE: %ld", (long)operation.response.statusCode);
    NSLog(@"Return: %@", responseObject);
    
    finishedBlock(responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Operation : %@", operation.userInfo);
    NSLog(@"Error: %@", error);
    
}];
}

#pragma mark - Utility Methods
- (NSString *)getRequestParameters:(NSDictionary *)parameters
{
    NSMutableString *requestParameters  = [[NSMutableString alloc] init];
    
    NSArray *keys = [parameters allKeys];
    
    for (NSString* key in keys)
    {
        NSString *value = [NSString stringWithFormat:@"%@", [parameters objectForKey:key]];
        
        NSString *encodedValue = [self encodeValueFromString:value];
        [requestParameters appendString:[NSString stringWithFormat:@"%@=%@&", key, encodedValue]];
    }
    
    return requestParameters;
}

- (NSString *)encodeValueFromString:(NSString *)value
{
    NSString *encodedValue = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                 (CFStringRef)value,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8));
    return encodedValue;
}

@end
