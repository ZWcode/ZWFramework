//
//  ZWNavigationController.m
//  BookSystem
//
//  Created by 曾威 on 15/12/24.
//  Copyright © 2015年 曾威. All rights reserved.
//

#import "ZWNavigationController.h"

@interface ZWNavigationController ()

@end

@implementation ZWNavigationController

+ (void)initialize
{
    
    // 设置整个项目所有item的主题样式
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
//    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
//    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    //
//    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
//    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [UIViewController preferredStatusBarStyle];
//    self.view.backgroundColor = [UIColor whiteColor];//解决导航控制器push和pop时出现黑色阴影的bug

    //set NavigationBar 背景颜色
        [self.navigationBar setBarTintColor:themeColor];

    //    //@{}代表Dictionary
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];//标题颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//设置返回按钮颜色
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.view.backgroundColor = RGBColor(245, 245, 247, 1);
    
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self getBackBtn]];
    }
    
    [super pushViewController:viewController animated:animated];//这里要写最后面
}

- (UIButton *)getBackBtn{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"back_Normal"] forState:UIControlStateNormal];
    return btn;
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
