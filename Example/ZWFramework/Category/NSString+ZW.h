//
//  NSString+ZW.h
//  BookSystem
//
//  Created by 曾威 on 16/2/12.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZW)

/*!
 *	@brief 计算动态高度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 *  @brief  按指定字符串splitStr拼接数组字符串成员，忽略空字符串
 */
+ (NSString *)getAppendedStrFrom:(NSArray <NSString *>*)array SplitStr:(NSString *)splitStr;

/*!
 *  @brief 沙盒路径
 */
+ (NSString *)documentPath;

#pragma mark - 登陆数据相关
/*!
 *  @brief 保存用户账号
 */
+ (void)saveUserAccount:(NSString *)account;

/*!
 *	@brief 获取保存到本地的用户账号
 */
+ (NSString *)getUserAccount;

/*!
 *	@brief 保存用户密码
 */
+ (void)saveUserPwd:(NSString *)pwd;

/*!
 *	@brief 获取保存到本地的用户密码
 */
+ (NSString *)getUserPwd;


@end
