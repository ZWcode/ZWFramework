//
//  ZWLabelsView.m
//  HQT_Enterprise
//
//  Created by 曾威 on 16/5/10.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWLabelsView.h"

@interface ZWLabelsView ()

@property (nonatomic, copy)   NSString         *labelsString;
@property (nonatomic, strong) NSMutableArray   *labelsArray;

@end

@implementation ZWLabelsView

+ (instancetype)labelsWithString:(NSString *)string Frame:(CGRect)frame{
    ZWLabelsView *labelsView = [[ZWLabelsView alloc] initWithString:string Frame:frame];
    return labelsView;
}

- (instancetype)initWithString:(NSString *)string Frame:(CGRect)frame{
    if (self = [super init]) {
        self.frame = frame;
        self.labelsString = [string stringByReplacingOccurrencesOfString:@"，" withString:@","];

        [self addLabels];
    }
    return self;
}

- (CGPoint)addLabels{
    [self removeAllSubviews];
    CGFloat x = 15.f;
    CGFloat y = 8.f;
    CGFloat btnWidth = 0;/**<按钮的宽度*/
    CGFloat remainWidth = SCREEN_WIDTH;/**<当前行剩余宽度*/
    for (NSString *title in self.labelsArray) {
        if (title.length<1) {
            continue;
        }
        UIButton *btn = [UIButton buttonWithTitle:title font:ZWFont_13 titleColor:themeColor];
        btn.userInteractionEnabled = NO;
        [btn setBackgroundImage:[UIImage resizeWithImageName:@"labelsBg"] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        CGSize size = [title sizeWithFont:ZWFont_13 constrainedToSize:CGSizeMake(MAXFLOAT, 21)];
        btnWidth = size.width+10;/**<设置按钮的宽度*/
        //如果剩余宽度不够
        if (remainWidth<btnWidth) {
            remainWidth = SCREEN_WIDTH-40;/**<重置剩余宽度*/
            y+=28;/**<换行*/
            x=20;/**<重置x轴*/
        }
        //如果剩余高度不够
        if (self.frame.size.height<y) {
            [btn removeFromSuperview];
            return CGPointMake(x, y);
        }
        remainWidth = remainWidth-btnWidth-15;/**<计算剩余宽度,15是按钮之间的间隙*/
//        NSLog(@"%f,%f",remainWidth,btnWidth);

        [btn remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(x);
            make.top.equalTo(y);
            make.width.equalTo(btnWidth);
            make.height.equalTo(20);
        }];

        x+=btnWidth+15;
    }
    
    return CGPointMake(x, y);
}

#pragma mark - getter
- (NSMutableArray *)labelsArray{
    if (!_labelsArray) {
        NSArray *tempArray = [self.labelsString componentsSeparatedByString:@","];
        _labelsArray = [[NSMutableArray alloc] initWithArray:tempArray];
        //移除空对象
        [_labelsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *string = obj;
            if (string.length<1) {
                [_labelsArray removeObject:string];
                *stop = YES;
            }
        }];
    }
    return _labelsArray;
}

@end
