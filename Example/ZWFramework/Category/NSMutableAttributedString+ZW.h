//
//  NSMutableAttributedString+ZW.h
//  HQT_Enterprise
//
//  Created by 曾威 on 16/6/4.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (ZW)

/**
 *  @brief  多种颜色的AttributedString,数组和颜色一一对应
 */
+ (NSMutableAttributedString *)stringWithStr:(NSArray <NSString *>*)strArr color:(NSArray <UIColor *>*)colorArr;
@end
