//
//  NSAttributedString+ZW.h
//  GoodFuture
//
//  Created by 曾威 on 16/4/28.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ZW)

/**
 *  @brief  解析HTML字符串
 */
+ (NSAttributedString *)analysisHTMLWithString:(NSString *)text;
@end
