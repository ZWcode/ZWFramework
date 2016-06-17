//
//  ZWTableViewController.h
//  HQT_Enterprise
//
//  Created by 曾威 on 16/5/10.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWTableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;

@end
