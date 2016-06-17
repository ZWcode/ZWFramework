//
//  ZWHorizonPagingView.h
//  ZWHorizonPagingView
//
//  Created by 曾威 on 16/4/30.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  使用说明：子控件若是scrollview必须设置contentsize，若是table且高度较小必须设置最低高度为ScreenHeight-segmentHeight
 *  @tips   ① 这个控件不需要设置frame
            ② contentViews无需设置frame,但是segmentBtns必须要设置
            ③ header 的 y轴从64.f开始
 */

@interface ZWHorizonPagingView : UIView

@property (nonatomic, strong) UIView        *segmentView;/**<suspend view*/
@property (nonatomic, strong) UIView        *underLine;/**<current view indicate underLine*/
@property (nonatomic, copy)   UIColor       *splitLineColor;/**<custom splitLineColor*/

+ (instancetype)pagingWithTopView:(UIView *)topView segmentHeight:(CGFloat)segmentHeight segmentBtns:(NSArray *)segmentBtns contentViews:(NSArray *)contentViews;

@end
