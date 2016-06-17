//
//  ZWPageControl.h
//  HQT_Enterprise
//
//  Created by 曾威 on 16/5/23.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWPageControl : UIView

+ (instancetype)controlWithFrame:(CGRect)frame Num:(NSInteger)num dotSize:(CGSize)size dotMargin:(CGFloat)margin normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

- (void)setCurrentPage:(NSInteger)num;
@end
