//
//  UIButton+ZW.h
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZW)
/*!
 *  @brief 不带响应事件的button
 */
+ (UIButton *)buttonWithTitle:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color;

/*!
 *  @brief 带响应事件的button
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame Title:(NSString *) title Target:(id)target action:(SEL)action font:(UIFont *)font titleColor:(UIColor *)color;
@end
