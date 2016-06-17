//
//  NSDate+ZW.h
//  GoodFuture
//
//  Created by 曾威 on 16/3/7.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZW)

/**
 *  @brief  由时间戳转成指定格式，格式举例yyyy-MM-dd HH:mm:ss
 *
 *  @param someDate   时间戳
 *  @param withformat 需要的日期格式
 */
+(NSString *)getDateString:(NSDate *)someDate
                withFormat:(NSString *)withformat;
/**
 *  @brief  根据时间戳字符串转成指定格式(注意内部处理的是毫秒数)，格式举例yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)getDateString:(NSString *)timeString withformat:(NSString *)format;

/*!
 *  @brief  获取当前日期
 */
+(NSString *)getCurrentDate:(NSString *)withformat;

/**
 *  @brief  获取距离指定日期前后N天的日期：如forDay=-3->前3天
 */
+ (NSString *)getSomeDate:(NSDate *)date withFormat:(NSString *)format forDay:(NSInteger)forDay;

/*!
 *  @brief  计算两个日期之间的天数
 */
+ (NSInteger)daysBetweenDate:(NSString *)fromDate
                     andDate:(NSString *)toDate;

/*!
 *  @brief  将字符串由一种格式的日期转化为另一种格式的日期字符串
 */
+ (NSString *)getStringFromFormat:(NSString *)oldFormat
                         toFormat:(NSString *)newFormat
                            about:(NSString *)dataString;


/*!
 *  @brief  比较日期是否为本月
 */
+ (BOOL)compareDataWithNowMonthFormat:(NSString *)oldFormat
                      aboutDataString:(NSString *)dataString;


/*!
 *  @brief  比较日期是否为本年
 */
+ (BOOL)compareDataWithNowYearFormat:(NSString *)oldFormat
                     aboutDataString:(NSString *)dataString;
@end
