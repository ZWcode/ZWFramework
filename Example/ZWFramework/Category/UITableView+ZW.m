//
//  UITableView+ZW.m
//  GoodFuture
//
//  Created by 曾威 on 16/4/12.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "UITableView+ZW.h"

@implementation UITableView (ZW)
- (void)reloadFirstSectionData{
    [self reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)reloadRow:(NSInteger)row inSection:(NSInteger)section{
    NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:section];
    [self reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)reloadSection:(NSInteger)section{
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
