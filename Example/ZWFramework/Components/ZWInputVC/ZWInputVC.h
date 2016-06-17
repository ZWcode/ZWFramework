//
//  InputVC.h
//  GoodFuture
//
//  Created by 曾威 on 16/3/14.
//  Copyright © 2016年 曾威. All rights reserved.
//  输入组件

#import <UIKit/UIKit.h>

@interface ZWInputVC : UIViewController

@property (nonatomic, strong) UITextView    *inputView;/**<输入框*/
@property (nonatomic, assign) int           maxBytes;/**<限制输入的字节数,一个汉字=3个字节*/
@property (nonatomic, assign) int           maxLength;/**<限制输入最长汉字字数,如果同时设置了maxBytes,此设置无效*/

/**
 *  初始化：设置title，content,完成按钮回调
 */
+ (instancetype)inputWithTitle:(NSString *)title content:(NSString *)content CallBack:(void(^)(NSString *inputContent))block;
@end
