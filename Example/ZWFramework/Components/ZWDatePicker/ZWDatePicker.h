//
//  ZWDatePicker.h
//  GoodFuture
//
//  Created by 曾威 on 16/3/14.
//  Copyright © 2016年 曾威. All rights reserved.
//  加在window上

#import <UIKit/UIKit.h>

@interface ZWDatePicker : UIView
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIDatePicker *picker;

+ (instancetype)pickerWithFormat:(NSString *)format :(void(^)(NSString *dateString,UIDatePicker *datePicker))block;
@end
