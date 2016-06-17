//
//  UIAlertController+ZW.m
//  GoodFuture
//
//  Created by 曾威 on 16/2/27.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "UIAlertController+ZW.h"

@implementation UIAlertController (ZW)
+ (UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message sure:(void(^) (UIAlertAction *action))sureBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock(action);
        }
    }];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)alertTwoBtnWithTitle:(NSString *)title message:(NSString *)message sure:(void(^) (UIAlertAction *action))sureBlock cancel:(void(^) (UIAlertAction *action))cancelBlock{
    UIAlertController *alert = [self alertWithTitle:title message:message sure:^(UIAlertAction *action) {
        if (sureBlock) {
            sureBlock(action);
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock(action);
        }
    }];
    [alert addAction:cancelAction];
    return alert;
}

+ (UIAlertController *)actionSheetWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle action:(void(^) (UIAlertAction *action))actionBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (actionBlock) {
            actionBlock(action);
        }
    }];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)actionSheetWithTwoBtn:(NSString *)title message:(NSString *)message actionTitle0:(NSString *)actionTitle0 actionTitle1:(NSString *)actionTitle1 action0:(void(^) (UIAlertAction *action))action0Block action1:(void(^) (UIAlertAction *action))action1Block{
    UIAlertController *alert = [self actionSheetWithTitle:title message:message actionTitle:actionTitle0 action:^(UIAlertAction *action) {
        if (action0Block) {
            action0Block(action);
        }
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:actionTitle1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (action1Block) {
            action1Block(action);
        }
    }];
    [alert addAction:action1];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alert addAction:cancelAction];
    return alert;
}
@end
