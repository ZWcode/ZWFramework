//
//  NSString+ZW.m
//  BookSystem
//
//  Created by 曾威 on 16/2/12.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "NSString+ZW.h"

@implementation NSString (ZW)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    
    NSDictionary *dic = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

+ (NSString *)getAppendedStrFrom:(NSArray <NSString *>*)array SplitStr:(NSString *)splitStr{
    NSMutableString *dictString = [NSMutableString string];
    __block BOOL haveValue = NO;
    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (haveValue==YES && obj.length>0) {
            [dictString appendFormat:@"%@%@",splitStr,obj];
        }
        if (haveValue==NO && obj.length>0) {
            [dictString appendFormat:@"%@",obj];
            haveValue = YES;
        }
        
    }];
    return dictString;
}

+ (NSString *)documentPath{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    /* 创建文件夹
    NSFileManager *fileManager = [NSFileManager defaultManager];
    path = [path stringByAppendingPathComponent:@"ListData"];
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
     
    拼接文件名：path = [path stringByAppendingPathComponent:@"district.plist"];
    写入改目录：[districtArr writeToFile:path atomically:YES];
     */
}

+ (void)saveUserAccount:(NSString *)account{
    [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"UserAccount"];
}

+ (NSString *)getUserAccount{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAccount"];
}

+ (void)saveUserPwd:(NSString *)pwd{
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"UserPwd"];
}

+ (NSString *)getUserPwd{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"UserPwd"];
}

@end
