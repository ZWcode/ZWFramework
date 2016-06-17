//
//  UILabel+ZW.m
//  BookSystem
//
//  Created by 曾威 on 16/1/13.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "UILabel+ZW.h"

@implementation UILabel (ZW)
+ (UILabel *)labelWithTitle:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    if (title) {
        label.text = title;
    }
    if (font) {
        label.font = font;
    }
    if (color) {
        [label setTextColor:color];
    }
    return label;
}

+ (UILabel *)labelWithFrame:(CGRect)frame Title:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color{
    UILabel *label = [UILabel labelWithTitle:title font:font titleColor:color];
    label.frame = frame;
    return label;
}

- (UILabel *)addAttributeWithString:(NSString *)string Margin:(CGFloat)margin color:(UIColor *)color alignment:(NSTextAlignment)alignment{
    self.numberOfLines = 0;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:string];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = margin;
    style.alignment = alignment;
    [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    self.attributedText = text;

    return self;
}
@end
