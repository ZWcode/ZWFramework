//
//  UIImage+ZW.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "UIImage+ZW.h"

@implementation UIImage (ZW)
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledMaxSize:(CGSize)maxSize{
    CGFloat imageWidth  = image.size.width;
    CGFloat imageHeight = image.size.height;
    CGFloat propertion  = 1.f;
    if (imageHeight>maxSize.height || imageWidth>maxSize.width) {
        propertion  = (maxSize.height>maxSize.width) ? (maxSize.width/imageWidth):(maxSize.height/imageHeight);
    }
    return [image imageWithImage:image scaledToSize:CGSizeMake(imageWidth*propertion, imageHeight*propertion)];
}

+ (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width*0.5;
    CGFloat h = normal.size.height*0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
