//
//  ZWTimerBtn.m
//  GoodFuture
//
//  Created by 曾威 on 16/4/13.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWTimerBtn.h"

typedef void(^ClickBlock)(ZWTimerBtn *btn);

@interface ZWTimerBtn ()

@property (nonatomic, copy)     ClickBlock      clickBlock;
@property (nonatomic, copy)     NSString        *title;
@property (nonatomic, strong)   NSTimer         *timer;
@property (nonatomic, assign)   NSInteger       remaindTimeToClick;//计时器重复的次数

@end

@implementation ZWTimerBtn
+ (instancetype)timerWithTitle:(NSString *)title ClickEvent:(ClickBlock)block{
    return [[ZWTimerBtn alloc] initWithTitle:title CallBack:block];
}

- (instancetype)initWithTitle:(NSString *)title CallBack:(ClickBlock)block{
    if (self = [super init]) {
        self.clickBlock = block;
        self.title = title;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:themeColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        self.titleLabel.font = ZWFont_15;
        [self.activityIndicator makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self);
        }];
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)click{
    [self setTitle:@"" forState:UIControlStateDisabled];
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}

- (void)startTimer{
    self.remaindTimeToClick = self.second;
    self.enabled = NO;
    [self setTitle:[NSString stringWithFormat:@"%ld",self.second] forState:UIControlStateNormal];
    
    [self setupTimer];
}

#pragma mark - timer
- (void)setupTimer
{
    [self setTitle:[NSString stringWithFormat:@"%ld",self.second] forState:UIControlStateDisabled];
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    // 添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    //0秒时恢复可点击
    if (self.remaindTimeToClick==0) {
        [self.timer invalidate];//移除定时器
        self.enabled = YES;
        [self setTitle:self.title forState:UIControlStateNormal];

    }else{
        
        //不可点击
        self.remaindTimeToClick--;
        NSString *string = [NSString stringWithFormat:@"%ld",self.remaindTimeToClick];
        [self setTitle:string forState:UIControlStateDisabled];
    }
}

#pragma mark - getter && setter
- (UIActivityIndicatorView *)activityIndicator{
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_activityIndicator];
        _activityIndicator.hidesWhenStopped = YES;
    }
    return _activityIndicator;
}

- (NSInteger)second{
    if (!_second) {
        _second = 60;
    }
    return _second;
}

- (void)setIsInitDisabled:(BOOL)isInitDisabled{
    _isInitDisabled = isInitDisabled;
    [self setTitle:self.title forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
}

@end
