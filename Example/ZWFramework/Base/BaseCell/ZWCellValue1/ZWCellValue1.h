//
//  ZWCellValue1.h
//  GoodFuture
//
//  Created by 曾威 on 16/4/6.
//  Copyright © 2016年 曾威. All rights reserved.
//  类似于系统的Value1的样式,提高定制性

#import <UIKit/UIKit.h>

/**
 *  @brief  使用说明：联合UITableView+FDTemplateLayoutCell.h使用：注册cell，高度代理block内设置数据
 */

/**
 *  @brief  要使用定制属性Trailing、VarticallyMargin，和设置其他数据一样要在FD设置高度block内再写一遍
 如：if (indexPath.row == 10) {
 cell.Trailing = 35.f;
 cell.VarticallyMargin = 20.f;
 }else{
 cell.VarticallyMargin = 8.f;
 cell.Trailing = 0.f;
 }
 */

typedef NS_ENUM(NSInteger, Type) {
    Checkmark /**<自定义Checkmark样式*/
};

@interface ZWCellValue1 : UITableViewCell

@property (nonatomic, strong) UILabel           *TextLabel;
@property (nonatomic, strong) UILabel           *DetailTextLabel;
@property (nonatomic, assign) BOOL              dynamicHeight;/**<如果只要求实现默认状态下的动态高度，block设置YES即可*/
@property (nonatomic, assign) CGFloat           Trailing;/**<右边距，默认0*/
@property (nonatomic, assign) CGFloat           VarticallyMargin;/**<DetailTextLabel距离上下的间距，默认为8*/
@property (nonatomic, strong) UIView            *splitLine;/**<默认包含分割线，可以updateConstraints或hidden*/
@property (nonatomic, assign) Type              type;
@property (nonatomic, strong) UIButton          *customBtn;/**<未处理*/

+ (instancetype)value1WithTableView:(UITableView *)tableView;

- (void)setupView;
@end
