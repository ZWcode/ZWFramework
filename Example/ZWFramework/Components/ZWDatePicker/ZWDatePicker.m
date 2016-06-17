//
//  ZWDatePicker.m
//  GoodFuture
//
//  Created by 曾威 on 16/3/14.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWDatePicker.h"

#define mainViewHeight 260
#define pickerViewHeight 216

typedef void(^pickerBlock)(NSString *dateString,UIDatePicker *datePicker);

@interface ZWDatePicker ()
@property (nonatomic, copy)   NSString       *format;/**<要求的日期格式*/
@property (nonatomic, copy)   NSString       *tempDateString;/**<临时存储的日期*/
@property (nonatomic, copy)   pickerBlock    pickerblock;
@property (nonatomic, strong) UIButton       *coverBtn;
@property (nonatomic, strong) UIView         *mainView;/**<下部分picker*/
@end

@implementation ZWDatePicker
+ (instancetype)pickerWithFormat:(NSString *)format :(pickerBlock)block{
    return [[ZWDatePicker alloc] initWithFormat:format CallBack:block];
}

- (instancetype)initWithFormat:(NSString *)format CallBack:(pickerBlock)block{
    if (self = [super init]) {
        self.pickerblock = block;
        self.format = format;

        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        [self setupView];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.coverBtn.alpha = 0.1;
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.mainView.frame = CGRectMake(0, SCREEN_HEIGHT-mainViewHeight, SCREEN_WIDTH, mainViewHeight);
            } completion:^(BOOL finished) {
                
            }];
        }];

    }
    return self;
}

- (void)setupView{
    [self addSubview:self.coverBtn];
    self.cancelBtn = [UIButton buttonWithFrame:CGRectMake(0, 0, 80, 44) Title:@"取消" Target:self action:@selector(removeSelf) font:ZWFont_17 titleColor:[UIColor grayColor]];
    [self.mainView addSubview:self.cancelBtn];
    
    self.sureBtn = [UIButton buttonWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 80, 44) Title:@"确定" Target:self action:@selector(sure) font:ZWFont_17 titleColor:ZWColor_Blue];
    [self.mainView addSubview:self.sureBtn];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(8, 43, SCREEN_WIDTH-16, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    line.alpha = 0.25;
    [self.mainView addSubview:line];
}

- (void)sure{
    self.pickerblock(self.tempDateString,self.picker);
    [self removeSelf];
}

- (void)removeSelf{
    [UIView animateWithDuration:0.2 animations:^{
        self.mainView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, mainViewHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.coverBtn.alpha = 0.f;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];

}

- (void)updateDate:(UIDatePicker *)picker{
    self.tempDateString = [NSDate getDateString:picker.date withFormat:self.format];
}

#pragma mark - getter 
- (UIDatePicker *)picker{
    if (!_picker) {
        _picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, pickerViewHeight)];
        [_picker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
        _picker.backgroundColor = [UIColor whiteColor];
        _picker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        [self updateDate:_picker];
        //限制只能选择当前时间之后的时间
        //            NSDate *currentDate = [NSDate date];
        //            datePiker.minimumDate = currentDate;
        
        //    datePiker.datePickerMode = UIDatePickerModeTime;
    }
    return _picker;
}

- (UIButton *)coverBtn{
    if (!_coverBtn) {
        _coverBtn = [UIButton buttonWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) Title:nil Target:self action:@selector(removeSelf) font:nil titleColor:nil];
        _coverBtn.backgroundColor = [UIColor blackColor];
        _coverBtn.alpha = 0.f;
    }
    return _coverBtn;
}

- (UIView *)mainView{
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, mainViewHeight)];
        _mainView.backgroundColor = [UIColor whiteColor];
        [_mainView addSubview:self.picker];
        [self addSubview:_mainView];
    }
    return _mainView;
}
@end
