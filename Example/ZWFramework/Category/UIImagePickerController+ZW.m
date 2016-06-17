//
//  UIImagePickerController+ZW.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "UIImagePickerController+ZW.h"

@implementation UIImagePickerController (ZW)
+ (UIImagePickerController *)takePhoto{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        picker.sourceType = sourceType;
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
    return picker;
}
+ (UIImagePickerController *)takePhotoLib{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = sourceType;
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
    return picker;
}

@end
