//
//  KGPageManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGPageManager.h"

@implementation KGPageManager

- (void)setPaginationParameters:(NSDictionary *)dictionary
{
    self.currentPage = [[dictionary objectForKey:@"current_page"] integerValue];
    self.lastPage = [[dictionary objectForKey:@"last_page"] integerValue];
    
    if (self.currentPage == self.lastPage)
    {
        self.isLastPage = YES;
    }
    else
    {
        self.isLastPage = NO;
        self.nextPage = [[dictionary objectForKey:@"current_page"] integerValue] + 1;
    }
}

- (void)resetPaginationParameters
{
    self.currentPage = 0;
    self.lastPage = 0;
    self.isLastPage = YES;
}

- (NSUInteger)firstPage
{
    return 1;
}

- (NSUInteger)nextPage
{
    return self.currentPage + 1;
}

- (BOOL)isFirstPage
{
    return self.currentPage <= 1;
}

- (BOOL)isLastPage
{
    if (self.currentPage == 0)
        return YES;
    
    if (self.currentPage >= self.lastPage)
        return YES;
    else
        return NO;
}

@end
