//
//  ZWLabelsView.h
//  HQT_Enterprise
//
//  Created by 曾威 on 16/5/10.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWLabelsView : UIView
#warning 这个逻辑还可以优化
/**
 *  @brief  指定frame的标签view
 *
 *  @param string 按，分割的标签字符串(如：萌萌哒，有责任心)
 */
+ (instancetype)labelsWithString:(NSString *)string Frame:(CGRect)frame;

@end
