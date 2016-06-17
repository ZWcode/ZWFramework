//
//  ZWCellValue1.m
//  GoodFuture
//
//  Created by 曾威 on 16/4/6.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWCellValue1.h"

@implementation ZWCellValue1

@synthesize VarticallyMargin = _VarticallyMargin;

+ (instancetype)value1WithTableView:(UITableView *)tableView{
    
    ZWCellValue1 *cell = [tableView dequeueReusableCellWithIdentifier:[ZWCellValue1 description]];
    if (!cell) {
        cell = [[ZWCellValue1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZWCellValue1 description]];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    
    [self.TextLabel remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.width.equalTo(102);
        make.centerY.equalTo(self.contentView);
    }];
    
    CGFloat countTrailing = self.Trailing;/**<用于计算高度的trailing*/
    if (countTrailing == 0.f) {
        countTrailing = 40.f;
    }
#warning 计算高度还不精确，117应该根据TextLabel变化
    CGFloat detailTextHeight = [self.DetailTextLabel.text sizeWithFont:ZWFont_14 constrainedToSize:CGSizeMake(self.frame.size.width-117-countTrailing, MAXFLOAT)].height+16;
    [self.DetailTextLabel remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(117);
        make.right.equalTo(-self.Trailing);
        make.top.equalTo(self.VarticallyMargin);
        make.bottom.equalTo(-self.VarticallyMargin);
        make.height.greaterThanOrEqualTo(detailTextHeight);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.splitLine remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.right.equalTo(20);
        make.height.equalTo(0.3);
        make.bottom.equalTo(self.contentView);
    }];
}

#pragma mark - setter
- (void)setDynamicHeight:(BOOL)dynamicHeight{
    _dynamicHeight = dynamicHeight;
    if (dynamicHeight == YES) {
        [self setupView];
    }
}
- (void)setTrailing:(CGFloat)Trailing{
    _Trailing = Trailing;
    [self setupView];
}

- (void)setVarticallyMargin:(CGFloat)VarticallyMargin{
    _VarticallyMargin = VarticallyMargin;
    [self setupView];
}

#pragma mark - getter
- (UILabel *)TextLabel{
    if (!_TextLabel) {
        _TextLabel = [UILabel labelWithTitle:nil font:ZWFont_14 titleColor:ZWColor_333333];
        [self.contentView addSubview:_TextLabel];
    }
    return _TextLabel;
}

- (UILabel *)DetailTextLabel{
    if (!_DetailTextLabel) {
        _DetailTextLabel = [UILabel labelWithTitle:nil font:ZWFont_14 titleColor:[UIColor grayColor]];
        _DetailTextLabel.textAlignment = NSTextAlignmentRight;
        _DetailTextLabel.numberOfLines = 0;
        [self.contentView addSubview:_DetailTextLabel];
    }
    return _DetailTextLabel;
}

- (CGFloat)VarticallyMargin{
    if (!_VarticallyMargin) {
        _VarticallyMargin = 8.f;
    }
    return _VarticallyMargin;
}

- (UIView *)splitLine{
    if (!_splitLine) {
        _splitLine = [UIView new];
        _splitLine.backgroundColor = ZWColor_SplitGray;
        [self.contentView addSubview:_splitLine];
    }
    return _splitLine;
}

- (UIButton *)customBtn{
    if (!_customBtn) {
        _customBtn = [UIButton new];
        [self.contentView addSubview:_customBtn];
    }
    return _customBtn;
}
@end
