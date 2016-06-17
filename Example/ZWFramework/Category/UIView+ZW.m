//
//  UIView+ZW.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "UIView+ZW.h"

@implementation UIView (ZW)
#pragma mark - cornerRadius
- (void)cornerRadius:(CGFloat)radius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)removeAllSubviews{
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

#pragma mark - findFirstResponder
- (UIView *)findFirstResponder
{
    if ([self isFirstResponder]) {
        return self;
    }
    
    for (UIView *subview in [self subviews]) {
        UIView *firstResponder = [subview findFirstResponder];
        if (nil != firstResponder) {
            return firstResponder;
        }
    }
    
    return nil;
}
@end
