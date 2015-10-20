//
//  KGTableViewCell.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGTableViewCell : UITableViewCell

+ (id)loadNib;
+ (NSString *)reuseIdentifier;
+ (CGFloat)cellHeight;

@end
