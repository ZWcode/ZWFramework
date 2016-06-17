//
//  UILabel+ZW.h
//  BookSystem
//
//  Created by 曾威 on 16/1/13.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZW)
/*!
 *  @brief 创建没有frame的label
 *
 *  @param title
 *  @param font
 *  @param color
 *
 *  @return
 */
+ (UILabel *)labelWithTitle:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color;
/*!
 *  @brief 创建有frame的label
 *
 *  @param frame
 *  @param title
 *  @param font
 *  @param color
 *
 *  @return 
 */
+ (UILabel *)labelWithFrame:(CGRect)frame Title:(NSString *) title font:(UIFont *)font titleColor:(UIColor *)color;
/**
 *  @brief  通过Attribute给label设置行距
 */
- (UILabel *)addAttributeWithString:(NSString *)string Margin:(CGFloat)margin color:(UIColor *)color alignment:(NSTextAlignment)alignment;
@end
