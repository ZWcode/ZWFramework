//
//  NSDate+ZW.m
//  GoodFuture
//
//  Created by 曾威 on 16/3/7.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "NSDate+ZW.h"

@implementation NSDate (ZW)

+(NSString *)getDateString:(NSDate *)someDate withFormat:(NSString *)withformat; {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = withformat;
    return [formatter stringFromDate:someDate];
}

+ (NSString *)getDateString:(NSString *)timeString withformat:(NSString *)format{
    NSString *needTime = [NSString stringWithFormat:@"%f",timeString.doubleValue/1000];
    NSDate *timeData = [[NSDate alloc] initWithTimeIntervalSince1970:needTime.doubleValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:timeData];
}

+ (NSString *)getCurrentDate:(NSString *)withformat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = withformat;
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)getSomeDate:(NSDate *)date withFormat:(NSString *)format forDay:(NSInteger)forDay{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = forDay;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:date options:0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    
    return [formatter stringFromDate:newDate];
}

+ (NSInteger)daysBetweenDate:(NSString *)fromDate andDate:(NSString *)toDate
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyyMMdd"];
    NSDate *fD = [f dateFromString:fromDate];
    NSDate *fE = [f dateFromString:toDate];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *startDate;
    NSDate *endDate;
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&startDate
                 interval:NULL forDate:fD];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&endDate
                 interval:NULL forDate:fE];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:startDate toDate:endDate options:0];
    return [difference day];
}

+ (NSString *)getStringFromFormat:(NSString *)oldFormat
                         toFormat:(NSString *)newFormat
                            about:(NSString *)dataString
{
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:oldFormat];
    NSDate *date = [formatter dateFromString:dataString];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateValue = [formatter stringFromDate:date];
    return dateValue;
}

+ (BOOL)compareDataWithNowMonthFormat:(NSString *)oldFormat
                      aboutDataString:(NSString *)dataString
{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    [dateFormate setDateFormat:oldFormat];
    NSDate *date = [dateFormate dateFromString:dataString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *dateString  = [dateFormatter stringFromDate:date];
    NSString *month1 = [NSString stringWithFormat:@"%@月",[dateString substringWithRange:NSMakeRange(4, 2)]];;
    
    NSDate *nowDate =[NSDate date];
    NSString *nowDateString  = [dateFormatter stringFromDate:nowDate];
    NSString *month2 = [NSString stringWithFormat:@"%@月",[nowDateString substringWithRange:NSMakeRange(4, 2)]];;
    
    if ([month1 isEqualToString:month2])
    {
        if ([NSDate compareDataWithNowYearFormat:oldFormat aboutDataString:dateString])
        {
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)compareDataWithNowYearFormat:(NSString *)oldFormat
                     aboutDataString:(NSString *)dataString
{
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc] init];
    [dateFormate setDateFormat:oldFormat];
    NSDate *date = [dateFormate dateFromString:dataString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *nowDate =[NSDate date];
    
    NSString *nowDateString  = [dateFormatter stringFromDate:nowDate];
    NSString *dateString  = [dateFormatter stringFromDate:date];
    
    NSString *str1 = [nowDateString substringToIndex:4];
    NSString *str2 = [dateString substringToIndex:4];
    
    if ([str1 isEqualToString:str2])
    {
        return YES;
    }
    return NO;
}

@end
