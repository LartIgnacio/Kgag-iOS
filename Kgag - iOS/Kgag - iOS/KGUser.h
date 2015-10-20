//
//  KGUser.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/29/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KGIdentityObjectKey                       @"id"
#define KGUserNameObjectKey                       @"username"
#define KGPasswordObjectKey                       @"password"
#define KGFirstNameObjectKey                      @"firstname"
#define KGLastNameObjectKey                       @"lastname"

@interface KGUser : NSObject

@property NSUInteger identity;
@property NSString *userName;
@property NSString *password;
@property NSString *firstName;
@property NSString *lastName;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (void)updateWithDictionary:(NSDictionary *)dictionary;

@end
