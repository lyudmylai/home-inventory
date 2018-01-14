//
//  JETRecognizedItemTableViewCell.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETRecognizedItemTableViewCell.h"

@interface JETRecognizedItemTableViewCell ()

@end

@implementation JETRecognizedItemTableViewCell

static CGFloat const kInset = 20.0;
static CGFloat const kLeftInset = 50.0;
static CGFloat const kFontSize = 16.0;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self addTitleLabel];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIFont *labelFont = [UIFont systemFontOfSize:kFontSize];
    CGRect titleLabelBoundingRect =
                    [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - (kInset + kLeftInset),
                                                                          NSIntegerMax)
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:labelFont}
                                                       context:nil];
    [self.titleLabel setFrame:CGRectMake(kLeftInset,
                                         kInset,
                                         ceil(titleLabelBoundingRect.size.width),
                                         ceil(titleLabelBoundingRect.size.height))];
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

- (void)addTitleLabel {
    if (!self.titleLabel) {
        UIFont *labelFont = [UIFont systemFontOfSize:kFontSize];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLabel.font = labelFont;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.textColor = [UIColor darkGrayColor];
        self.titleLabel.numberOfLines = 0;
        [self addSubview:self.titleLabel];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
