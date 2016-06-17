//
//  UIViewController+Request.m
//  GoodFuture
//
//  Created by 曾威 on 16/2/24.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "UIViewController+Request.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "Serve.h"

typedef void (^success)(NSURLSessionDataTask *task, id responseObject);
typedef void (^failure)(NSURLSessionDataTask *task, NSError *error);

@interface UIViewController ()

@end

@implementation UIViewController (Request)
- (NSURLSessionDataTask *)postWithoutAlert:(NSString *)URL parameters:(id)parameters success:(success)successBlock failure:(failure)failureBlock{
    
    URL = [NSString stringWithFormat:@"%@%@",kServerAddress, URL];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 45;
    
    NSURLSessionDataTask *task = [manager POST:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(task,responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@请求失败:%@",URL,error);
        
        if (failureBlock) {
            failureBlock(task,error);
        }
    }];
    
    return task;
}

- (NSURLSessionDataTask *)post:(NSString *)URL parameters:(id)parameters success:(success)successBlock failure:(failure)failureBlock sure:(void(^)(UIAlertAction * action))sure
{

    NSURLSessionDataTask *task =[self postWithoutAlert:URL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        //sucess不是0000(失败状态)
        NSString *success = [NSString stringWithFormat:@"%@",responseObject[@"success"]];
        if (![success isEqualToString:@"0000"]) {
            NSLog(@"url:%@,fail:%@",URL,responseObject);
            NSString *msg = [NSString stringWithFormat:@"%@",responseObject[@"msg"]];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (sure) {
                    sure(action);
                }
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
        if (successBlock) {
            successBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failureBlock) {
            failureBlock(task,error);
        }
    }];

    return task;
}

- (NSURLSessionDataTask *)postFileWith:(NSString *)URL parameters:(id)parameters constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(success)success failure:(failure)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 45;
    URL = [NSString stringWithFormat:@"%@%@",kServerAddress, URL];
    NSURLSessionDataTask *task = [manager POST:URL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (block) {
            block(formData);
        }
//        [formData appendPartWithFileData:UIImageJPEGRepresentation(self.logoImage, 1) name:@"logoaddress" fileName:@"logoaddress" mimeType:@"image/png"];
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task,responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@请求失败:%@",URL,error);
        
        if (failure) {
            failure(task,error);
        }

    }];
    return task;
}
@end
