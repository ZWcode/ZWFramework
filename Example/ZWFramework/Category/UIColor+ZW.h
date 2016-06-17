//
//  UIColor+ZW.h
//  GoodFuture
//
//  Created by 曾威 on 16/4/5.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromHex(HexValue) ([UIColor colorWithHex:HexValue])/**<转换16进制颜色*/

@interface UIColor (ZW)
/*!
 *  @brief  16进制获取颜色
 *
 *  @param hex  16进制颜色值
 */
+ (UIColor *) colorWithHex:(unsigned int)hex;

/*!
 *  @brief  16进制获取颜色，并且设置颜色透明度
 */
+ (UIColor *) colorWithHex:(unsigned int)hex
                     alpha:(CGFloat)alpha;

/*!
 *  @brief  随机获取颜色
 */
+ (UIColor *) randomColor;

@end
