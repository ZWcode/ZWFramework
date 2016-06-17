//
//  UIView+ZW.h
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZW)

- (void)cornerRadius:(CGFloat)radius;
/*
 *  @brief  移除所有子视图
 */
- (void)removeAllSubviews;
/**
 *  @brief  找到第一响应者
 */
- (UIView *)findFirstResponder;
@end
