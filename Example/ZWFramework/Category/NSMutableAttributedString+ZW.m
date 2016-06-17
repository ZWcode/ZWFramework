//
//  NSMutableAttributedString+ZW.m
//  HQT_Enterprise
//
//  Created by 曾威 on 16/6/4.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "NSMutableAttributedString+ZW.h"

@implementation NSMutableAttributedString (ZW)

+ (NSMutableAttributedString *)stringWithStr:(NSArray <NSString *>*)strArr color:(NSArray <UIColor *>*)colorArr{
    
    if (strArr.count != colorArr.count) {
        NSLog(@"stringWithStr:color:字符串数组和颜色数组长度不一致!");
        return [NSMutableAttributedString new];
    }
    
    NSMutableString *totalStr = [NSMutableString string];
    [strArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [totalStr appendString:obj];
    }];
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    __block NSInteger location = 0;
    [colorArr enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutableStr addAttribute:NSForegroundColorAttributeName value:obj range:NSMakeRange(location,strArr[idx].length)];
        location += strArr[idx].length;
    }];
    return mutableStr;
}
@end
