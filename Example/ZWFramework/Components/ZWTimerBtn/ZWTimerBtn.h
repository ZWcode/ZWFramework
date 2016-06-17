//
//  ZWTimerBtn.h
//  GoodFuture
//
//  Created by 曾威 on 16/4/13.
//  Copyright © 2016年 曾威. All rights reserved.
//  常用于获取验证码的按钮和请求过程需要菊花等待标识的按钮

#import <UIKit/UIKit.h>

/**
 *  @brief  使用流程：开始网络请求前[btn.activityIndicator startAnimating];
                                btn.enabled = NO;
             请求结束和请求失败：   btn.enabled = YES;
                                [btn.activityIndicator stopAnimating];
                    开启倒计时:   [btn startTimer];
 */
@interface ZWTimerBtn : UIButton
@property (nonatomic, strong) UIActivityIndicatorView   *activityIndicator;/**<菊花指示器*/
@property (nonatomic, assign) BOOL                      isInitDisabled;/**<初始化不可点击的按钮时使用*/
@property (nonatomic, assign) NSInteger                 second;/**<倒计时的秒数,默认60*/

/**
 *  @brief  初始化，设置nomal状态下的title，取得点击回调
 */
+ (instancetype)timerWithTitle:(NSString *)title ClickEvent:(void(^)(ZWTimerBtn *btn))block;

- (void)startTimer;/**<开始倒计时*/
@end
