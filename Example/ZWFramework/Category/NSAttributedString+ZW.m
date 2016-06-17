//
//  NSAttributedString+ZW.m
//  GoodFuture
//
//  Created by 曾威 on 16/4/28.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "NSAttributedString+ZW.h"

@implementation NSAttributedString (ZW)
+ (NSAttributedString *)analysisHTMLWithString:(NSString *)text{
    return [[NSAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
}
@end
