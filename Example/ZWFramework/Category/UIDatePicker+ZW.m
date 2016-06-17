//
//  UIDatePicker+ZW.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "UIDatePicker+ZW.h"

@implementation UIDatePicker (ZW)
+(UIDatePicker *)datePickerWithTarget:(id)target action:(SEL)action{
    UIDatePicker *datePiker = [[UIDatePicker alloc] init];
    
//    datePiker.datePickerMode = UIDatePickerModeTime;
    datePiker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datePiker.backgroundColor = [UIColor whiteColor];
    
    //限制只能选择当前时间之后的时间
    //            NSDate *currentDate = [NSDate date];
    //            datePiker.minimumDate = currentDate;
    
    //添加滚动选择的监听
    [datePiker addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    return datePiker;
}
@end
