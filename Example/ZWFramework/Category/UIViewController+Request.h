//
//  UIViewController+Request.h
//  GoodFuture
//
//  Created by 曾威 on 16/2/24.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface UIViewController (Request)
/**
 *  @brief  发送不需要警告框的请求
 */
- (NSURLSessionDataTask *)postWithoutAlert:(NSString *)URLString parameters:(id)parameters success:(void(^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failureBlock;

/**
 *  @brief  发送需要警告框的请求
 */
- (NSURLSessionDataTask *)post:(NSString *)URLString parameters:(id)parameters success:(void(^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failureBlock sure:(void(^)(UIAlertAction * action))sure;

/**
 *  @brief  发送没有警告框的上传文件请求
 */
- (NSURLSessionDataTask *)postFileWith:(NSString *)URL parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void(^)(NSURLSessionDataTask *task, id responseObject))success failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
