//
//  UITableView+ZW.h
//  GoodFuture
//
//  Created by 曾威 on 16/4/12.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZW)
/**
 *  @brief  如果tableview只有一组，以动画方式刷新这组数据
 */
- (void)reloadFirstSectionData;

/**
 *  @brief  以动画方式刷新指定组
 */
- (void)reloadSection:(NSInteger)section;

/**
 *  @brief  以动画方式刷新指定行
 */
- (void)reloadRow:(NSInteger)row inSection:(NSInteger)section;

@end
