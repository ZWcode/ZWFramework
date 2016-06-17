//
//  UIAlertController+ZW.h
//  GoodFuture
//
//  Created by 曾威 on 16/2/27.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ZW)
/*!
 *	@brief 带一个按钮的alert
 */
+ (UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message sure:(void(^) (UIAlertAction *action))sureBlock;

/*!
 *	@brief 带两个按钮“确定”和“取消”的alert
 */
+ (UIAlertController *)alertTwoBtnWithTitle:(NSString *)title message:(NSString *)message sure:(void(^) (UIAlertAction *action))sureBlock cancel:(void(^) (UIAlertAction *action))cancelBlock;

/**
 *  @brief  actionSheet样式带一个action
 */
+ (UIAlertController *)actionSheetWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle action:(void(^) (UIAlertAction *action))actionBlock;

/**
 *  @brief  actionSheet样式带两个action
 */
+ (UIAlertController *)actionSheetWithTwoBtn:(NSString *)title message:(NSString *)message actionTitle0:(NSString *)actionTitle0 actionTitle1:(NSString *)actionTitle1 action0:(void(^) (UIAlertAction *action))action0Block action1:(void(^) (UIAlertAction *action))action1Block;
@end
