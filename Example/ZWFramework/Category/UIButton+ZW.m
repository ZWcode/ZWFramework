//
//  UIButton+ZW.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "UIButton+ZW.h"

@implementation UIButton (ZW)
+ (UIButton *)buttonWithTitle:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color{
    UIButton *button = [[UIButton alloc] init];
    
    //设置文字
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    //设置字体
    if (font) {
        button.titleLabel.font = font;
    }
    
    //设置字体颜色
    if (color) {
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    return button;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame Title:(NSString *)title Target:(id)target action:(SEL)action font:(UIFont *)font titleColor:(UIColor *)color{
    UIButton *button = [UIButton buttonWithTitle:title font:font titleColor:color];
    button.frame = frame;
    
    //添加点击事件
    if (target) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

@end
