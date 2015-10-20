//
//  KGGagCell.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGGagCell.h"
#import <UIImageView+UIActivityIndicatorForSDWebImage.h>

@implementation KGGagCell

- (void)setGagCell:(KGGag *)gag
{
    self.textView.text = gag.message;
    [self.gagImageView setImageWithURL:[NSURL URLWithString:gag.urlString] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.dateCreatedLabel.text = gag.dateCreated;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
