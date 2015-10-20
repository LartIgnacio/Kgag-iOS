//
//  KGGagRequestManager.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KGAPIRequestManager.h"
#import "KGPageManager.h"
#import "KGURLPath.h"

@interface KGGagRequestManager : KGPageManager

- (void)requestGagList:(RequestFinishedBlock)finishedBlock
            errorBlock:(RequestErrorBlock)errorBlock
           cancelBlock:(RequestCancelBlock)cancelBlock;

- (void)requestAddGag:(NSDictionary *)imageDictionary
              message:(NSString *)message
        finishedBlock:(RequestFinishedBlock)finishedBock
           errorBlock:(RequestErrorBlock)errorBlock
          cancelBlock:(RequestCancelBlock)cancelBlock;

@end
