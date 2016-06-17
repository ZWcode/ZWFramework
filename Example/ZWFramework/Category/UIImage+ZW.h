//
//  UIImage+ZW.h
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZW)
/**
 *  压缩图片到指定尺寸
 */
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
/**
 *  @brief  按比例压缩图片到指定范围内
 */
- (UIImage *)imageWithImage:(UIImage *)image scaledMaxSize:(CGSize)maxSize;
/**
 *  @brief  处理要求中间拉伸的图片
 */
+ (UIImage *)resizeWithImageName:(NSString *)name;
@end
