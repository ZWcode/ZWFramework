//
//  ZWPageControl.m
//  HQT_Enterprise
//
//  Created by 曾威 on 16/5/23.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWPageControl.h"

@interface ZWPageControl ()

@property (nonatomic, assign) NSInteger     num;
@property (nonatomic, assign) CGSize        size;
@property (nonatomic, assign) CGFloat       dotMargin;
@property (nonatomic, strong) UIImage       *imagetateNormal;
@property (nonatomic, strong) UIImage       *imageStateSelected;

@end

@implementation ZWPageControl
+ (instancetype)controlWithFrame:(CGRect)frame Num:(NSInteger)num dotSize:(CGSize)size dotMargin:(CGFloat)margin normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    ZWPageControl *control = [ZWPageControl new];
    control.frame = frame;
    control.num = num;
    control.size = size;
    control.dotMargin = margin;
    control.imagetateNormal = normalImage;
    control.imageStateSelected = selectedImage;
    [control setupView];
    if (num==0) return [ZWPageControl new];
    return control;
}

- (void)setupView{
    CGFloat x= 0;
    for (int i=0; i<self.num; i++) {
        UIButton *btn = [UIButton new];
        btn.tag = i;
        [btn setImage:self.imagetateNormal forState:UIControlStateNormal];
        [btn setImage:self.imageStateSelected forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickDot:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btn remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(x);
            make.width.equalTo(self.size.width);
        }];
        
        x+=self.size.width+self.dotMargin;
    }
}

- (void)clickDot:(UIButton *)btn{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        [btn setSelected:NO];
    }];
    [btn setSelected:YES];
}

- (void)setCurrentPage:(NSInteger)num{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        [btn setSelected:NO];
    }];
    UIButton *btn = self.subviews[num];
    [btn setSelected:YES];
}

@end
