//
//  JETAddDetailsView.m
//  HomeInventory
//
//  Created by Lyudmyla Ivanova on 1/13/18.
//  Copyright © 2018 Lyudmyla Ivanova. All rights reserved.
//

#import "JETAddDetailsView.h"

@interface JETAddDetailsView ()

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *brandLabel;
@property (strong, nonatomic) UILabel *yearLabel;
@property (strong, nonatomic) UILabel *priceLabel;

@end

@implementation JETAddDetailsView

static NSString *const kTitleLabelText = @"Title";
static NSString *const kBrandLabelText = @"Brand";
static NSString *const kYearLabelText = @"Year";
static NSString *const kPriceLabelText = @"Price";
static NSString *const kBrandPlaceholderText = @"Brand...";
static NSString *const kYearPlaceholderText = @"Year...";
static NSString *const kPricePlaceholderText = @"Price...";
static CGFloat const kInset = 10.0;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    self.contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(self.frame.origin.x,
                                                                     self.frame.origin.y,
                                                                     self.frame.size.width,
                                                                     0)];
    [self.scrollView addSubview:self.contentView];
    [self addSubview:self.scrollView];
    [self addTitleLabel];
    [self addTitleTextField];
    [self addBrandLabel];
    [self addBrandTextField];
    [self addYearLabel];
    [self addYearTextField];
    [self addPriceLabel];
    [self addPriceTextField];
    return self;
}

- (void)layoutSubviews {
    [self.titleLabel setFrame:CGRectMake(2 * kInset, kInset,
                                         self.frame.size.width - 4 * kInset,
                                         self.titleLabel.frame.size.height)];
    [self.titleTextField setFrame:CGRectMake(2 * kInset,
                                             CGRectGetMaxY(self.titleLabel.frame) + kInset,
                                             self.frame.size.width - 4 * kInset,
                                             self.titleTextField.frame.size.height)];
    [self.brandLabel setFrame:CGRectMake(2 * kInset,
                                         CGRectGetMaxY(self.titleTextField.frame) + 2 * kInset,
                                         self.frame.size.width - 4 * kInset,
                                         self.brandLabel.frame.size.height)];
    [self.brandTextField setFrame:CGRectMake(2 * kInset,
                                             CGRectGetMaxY(self.brandLabel.frame) + kInset,
                                             self.frame.size.width - 4 * kInset,
                                             self.titleTextField.frame.size.height)];
    [self.yearLabel setFrame:CGRectMake(2 * kInset,
                                         CGRectGetMaxY(self.brandTextField.frame) + 2 * kInset,
                                         self.frame.size.width - 4 * kInset,
                                         self.yearLabel.frame.size.height)];
    [self.yearTextField setFrame:CGRectMake(2 * kInset,
                                            CGRectGetMaxY(self.yearLabel.frame) + kInset,
                                            self.frame.size.width - 4 * kInset,
                                            self.yearTextField.frame.size.height)];
    [self.priceLabel setFrame:CGRectMake(2 * kInset,
                                         CGRectGetMaxY(self.yearTextField.frame) + 2 * kInset,
                                         self.frame.size.width - 4 * kInset,
                                         self.priceLabel.frame.size.height)];
    [self.priceTextField setFrame:CGRectMake(2 * kInset,
                                             CGRectGetMaxY(self.priceLabel.frame) + kInset,
                                             self.frame.size.width - 4 * kInset,
                                             self.priceTextField.frame.size.height)];
    [self.contentView setFrame:CGRectMake(self.contentView.frame.origin.x,
                                          self.contentView.frame.origin.y,
                                          self.contentView.frame.size.width,
                                          CGRectGetMaxY(self.priceTextField.frame) + kInset)];
    [self.scrollView setContentSize:self.contentView.frame.size];
}

- (void)addTitleLabel {
    if (!self.titleLabel) {
        CGFloat fontSize = 14.0;
        UIFont *labelFont = [UIFont systemFontOfSize:fontSize];
        CGRect titleLabelBoundingRect =
        [kTitleLabelText boundingRectWithSize:CGSizeMake(self.frame.size.width - 2 * kInset,
                                                              NSIntegerMax)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:labelFont}
                                      context:nil];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                  kInset,
                                                                  ceil(titleLabelBoundingRect.size.width),
                                                                  ceil(titleLabelBoundingRect.size.height))];
        self.titleLabel.font = labelFont;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.textColor = [UIColor darkGrayColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.text = kTitleLabelText;
        [self.contentView addSubview:self.titleLabel];
    }
}

- (void)addTitleTextField {
    CGFloat fontSize = 18.0;
    self.titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(2 * kInset, kInset,
                                                                       self.frame.size.width - 4 * kInset, 40)];
    self.titleTextField.font = [UIFont boldSystemFontOfSize:fontSize];
    self.titleTextField.textColor = [UIColor darkGrayColor];
    self.titleTextField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    self.titleTextField.backgroundColor = [UIColor whiteColor];
    self.titleTextField.clipsToBounds = YES;
    [self.contentView addSubview:self.titleTextField];
}

- (void)addBrandLabel {
    if (!self.brandLabel) {
        CGFloat fontSize = 14.0;
        UIFont *labelFont = [UIFont systemFontOfSize:fontSize];
        CGRect brandLabelBoundingRect =
        [kBrandLabelText boundingRectWithSize:CGSizeMake(self.frame.size.width - 2 * kInset,
                                                         NSIntegerMax)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:labelFont}
                                      context:nil];
        self.brandLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                CGRectGetMaxY(self.titleTextField.frame) + 2 * kInset,
                                                                ceil(brandLabelBoundingRect.size.width),
                                                                ceil(brandLabelBoundingRect.size.height))];
        self.brandLabel.font = labelFont;
        self.brandLabel.textAlignment = NSTextAlignmentLeft;
        self.brandLabel.textColor = [UIColor darkGrayColor];
        self.brandLabel.numberOfLines = 0;
        self.brandLabel.text = kBrandLabelText;
        [self.contentView addSubview:self.brandLabel];
    }
}

- (void)addBrandTextField {
    CGFloat fontSize = 18.0;
    self.brandTextField = [[UITextField alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                    CGRectGetMaxY(self.brandLabel.frame) + kInset,
                                                                    self.frame.size.width - 4 * kInset, 40)];
    self.brandTextField.font = [UIFont boldSystemFontOfSize:fontSize];
    self.brandTextField.textColor = [UIColor darkGrayColor];
    self.brandTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.brandTextField.placeholder = kBrandPlaceholderText;
    self.brandTextField.backgroundColor = [UIColor whiteColor];
    self.brandTextField.clipsToBounds = YES;
    [self.contentView addSubview:self.brandTextField];
}

- (void)addYearLabel {
    if (!self.yearLabel) {
        CGFloat fontSize = 14.0;
        UIFont *labelFont = [UIFont systemFontOfSize:fontSize];
        CGRect yearLabelBoundingRect =
        [kYearLabelText boundingRectWithSize:CGSizeMake(self.frame.size.width - 2 * kInset,
                                                         NSIntegerMax)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:labelFont}
                                      context:nil];
        self.yearLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                CGRectGetMaxY(self.brandTextField.frame) + 2 * kInset,
                                                                ceil(yearLabelBoundingRect.size.width),
                                                                ceil(yearLabelBoundingRect.size.height))];
        self.yearLabel.font = labelFont;
        self.yearLabel.textAlignment = NSTextAlignmentLeft;
        self.yearLabel.textColor = [UIColor darkGrayColor];
        self.yearLabel.numberOfLines = 0;
        self.yearLabel.text = kYearLabelText;
        [self.contentView addSubview:self.yearLabel];
    }
}

- (void)addYearTextField {
    CGFloat fontSize = 18.0;
    self.yearTextField = [[UITextField alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                       CGRectGetMaxY(self.yearLabel.frame) + kInset,
                                                                       self.frame.size.width - 4 * kInset, 40)];
    self.yearTextField.font = [UIFont boldSystemFontOfSize:fontSize];
    self.yearTextField.textColor = [UIColor darkGrayColor];
    self.yearTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.yearTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.yearTextField.placeholder = kYearPlaceholderText;
    self.yearTextField.backgroundColor = [UIColor whiteColor];
    self.yearTextField.clipsToBounds = YES;
    [self.contentView addSubview:self.yearTextField];
}

- (void)addPriceLabel {
    if (!self.priceLabel) {
        CGFloat fontSize = 14.0;
        UIFont *labelFont = [UIFont systemFontOfSize:fontSize];
        CGRect priceLabelBoundingRect =
        [kTitleLabelText boundingRectWithSize:CGSizeMake(self.frame.size.width - 2 * kInset,
                                                         NSIntegerMax)
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:@{NSFontAttributeName:labelFont}
                                      context:nil];
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                   CGRectGetMaxY(self.yearTextField.frame) + 2 * kInset,
                                                                   ceil(priceLabelBoundingRect.size.width),
                                                                   ceil(priceLabelBoundingRect.size.height))];
        self.priceLabel.font = labelFont;
        self.priceLabel.textAlignment = NSTextAlignmentLeft;
        self.priceLabel.textColor = [UIColor darkGrayColor];
        self.priceLabel.numberOfLines = 0;
        self.priceLabel.text = kPriceLabelText;
        [self.contentView addSubview:self.priceLabel];
    }
}

- (void)addPriceTextField {
    CGFloat fontSize = 18.0;
    self.priceTextField = [[UITextField alloc]initWithFrame:CGRectMake(2 * kInset,
                                                                    CGRectGetMaxY(self.priceLabel.frame) + kInset,
                                                                    self.frame.size.width - 4 * kInset, 40)];
    self.priceTextField.font = [UIFont boldSystemFontOfSize:fontSize];
    self.priceTextField.textColor = [UIColor darkGrayColor];
    self.priceTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.priceTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.priceTextField.placeholder = kPricePlaceholderText;
    self.priceTextField.backgroundColor = [UIColor whiteColor];
    self.priceTextField.clipsToBounds = YES;
    [self.contentView addSubview:self.priceTextField];
}

@end
