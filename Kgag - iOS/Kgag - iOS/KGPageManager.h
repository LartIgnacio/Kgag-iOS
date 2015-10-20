//
//  KGPageManager.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGAPIRequestManager.h"

@interface KGPageManager : KGAPIRequestManager

@property (nonatomic) NSUInteger firstPage;
@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) NSUInteger nextPage;
@property (nonatomic) NSUInteger lastPage;
@property (nonatomic) BOOL isLastPage;
@property (nonatomic) BOOL isFirstPage;

- (void)setPaginationParameters:(NSDictionary *)dictionary;
- (void)resetPaginationParameters;

@end
