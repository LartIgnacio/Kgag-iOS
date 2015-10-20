//
//  KGTableViewCell.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGTableViewCell.h"

@implementation KGTableViewCell

static NSMutableDictionary *cellHeightDictionary;

+ (void)initialize
{
    if (cellHeightDictionary == nil)
        cellHeightDictionary = [[NSMutableDictionary alloc] init];
}

#pragma mark - Class Initialization
+ (id)loadNib
{
    return [self loadNibWithStyle:0];
}

+ (id)loadNibWithStyle:(NSInteger)style
{
    NSArray* nib = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                 owner:nil
                                               options:nil];
    UITableViewCell* cell = nib[style];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

#pragma mark - Cell Identifier
+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - Cell Height
+ (CGFloat)cellHeight
{
    return [self cellHeightWithStyle:0];
}

+ (CGFloat)cellHeightWithStyle:(NSInteger)style
{
    NSString *key = [NSString stringWithFormat:@"%@_%ld", NSStringFromClass([self class]), (long)style];
    NSNumber *cellHeight = [cellHeightDictionary objectForKey:key];
    
    if (cellHeight == nil)
    {
        UITableViewCell* cell = [self loadNibWithStyle:style];
        cellHeight = [NSNumber numberWithFloat:cell.frame.size.height];
        [cellHeightDictionary setObject:cellHeight forKey:key];
    }
    
    return [cellHeight floatValue];
}

@end
