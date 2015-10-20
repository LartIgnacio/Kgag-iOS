//
//  KGUser.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/29/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGUser.h"

@implementation KGUser

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
        [self updateWithDictionary:dictionary];
    
    return self;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary
{
    self.identity = [[dictionary objectForKey:KGIdentityObjectKey] integerValue];
    self.userName = [dictionary objectForKey:KGUserNameObjectKey];
    self.password = [dictionary objectForKey:KGPasswordObjectKey];
    self.firstName = [dictionary objectForKey:KGFirstNameObjectKey];
    self.lastName = [dictionary objectForKey:KGLastNameObjectKey];
}

@end
