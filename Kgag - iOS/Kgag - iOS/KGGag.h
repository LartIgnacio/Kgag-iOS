//
//  KGGag.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KGUser.h"

@interface KGGag : NSObject

@property NSUInteger identity;
@property NSString *message;
@property NSString *urlString;
@property NSString *dateCreated;
@property KGUser *user;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
