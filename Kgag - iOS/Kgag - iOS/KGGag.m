//
//  KGGag.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGGag.h"
#import "KGURLPath.h"

@implementation KGGag

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        self.identity = [[dictionary objectForKey:@"id"] integerValue];
        self.message = [dictionary objectForKey:@"message"];
        
        NSDictionary *uploadDictionary = [dictionary objectForKey:@"upload"];
        self.urlString = [NSString stringWithFormat:@"%@%@", urlPhotoPath, [uploadDictionary objectForKey:@"path"]];
        self.dateCreated = [uploadDictionary objectForKey:@"created_at"];
        
        NSDictionary *userDictionary = [dictionary objectForKey:@"User"];
        self.user = [[KGUser alloc] initWithDictionary:userDictionary];
    }
    
    return self;
}

@end
