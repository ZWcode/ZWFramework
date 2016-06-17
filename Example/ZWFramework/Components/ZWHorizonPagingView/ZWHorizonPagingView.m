//
//  ZWHorizonPagingView.m
//  ZWHorizonPagingView
//
//  Created by 曾威 on 16/4/30.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWHorizonPagingView.h"
#import "UIView+ZW.h"

@interface ZWHorizonPagingView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView              *bgScrollView;/**<水平滚动*/
@property (nonatomic, strong) UIView                    *topView;/**<头部视图*/
@property (nonatomic, assign) CGFloat                   topViewHeight;

@property (nonatomic, assign) CGFloat                   segmentHeight;/**<选择视图的高度*/

@property (nonatomic, assign) CGFloat                   scrollY;/** 记录scrollView上次偏移Y的距离 */
@property (nonatomic, strong) UIScrollView              *showingScrollView;/**<记录当前滚动视图*/

@property (nonatomic, strong) NSArray                   *segmentBtns;/**<按钮数组*/
@property (nonatomic, strong) NSArray                   *contentViews;/**<垂直方向滚动视图*/

@property (nonatomic, strong) UIView                    *splitLine0;/**<segmentView里的分割线*/
@property (nonatomic, strong) UIView                    *splitLine1;/**<segmentView里的分割线*/
@end

@implementation ZWHorizonPagingView

static void *ZWVerticallyScrollViewContext = &ZWVerticallyScrollViewContext;/**<处理垂直方向contentViews的KVO参数*/
+ (instancetype)pagingWithTopView:(UIView *)topView segmentHeight:(CGFloat)segmentHeight segmentBtns:(NSArray *)segmentBtns contentViews:(NSArray *)contentViews{
    
    ZWHorizonPagingView *pagingView     = [ZWHorizonPagingView new];
    pagingView.backgroundColor          = [UIColor whiteColor];
    pagingView.frame                    = [UIScreen mainScreen].bounds;
    pagingView.segmentHeight            = segmentHeight;
    pagingView.topViewHeight            = topView.frame.size.height;
    pagingView.contentViews             = contentViews;
    pagingView.topView                  = topView;
    pagingView.segmentBtns              = segmentBtns;
    
    return pagingView;
}

- (void)clickSegmentBtn:(UIButton *)btn{

    [self.segmentBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        [btn setSelected:NO];
    }];
    [btn setSelected:YES];
    [self.bgScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*(btn.tag-1), -64.f) animated:YES];
    [self scrollViewWillBeginDragging:self.bgScrollView];
}

#pragma mark - scroll view delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //KVO方法里改变contentOffset，循环引用会crash，所以在这里处理contentViews的y值逻辑
    //临界点是segmentView刚刚置顶时的y轴，处理对象是除当前滚动视图之外的contentViews。
    //如果小于这个临界点，所有滚动视图的contentOffset保持一致->contentViews其余部分跟随滚动
    //如果大于这个临界点,情况一：已经向上滚动超出临界点，情况二：将其置0
    [self.contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIScrollView *scroll = obj;
        if (![scroll isEqual:self.showingScrollView]) {
            if (self.scrollY < self.topViewHeight) {
                scroll.contentOffset = CGPointMake(0, self.scrollY-self.topViewHeight);
            }else if (scroll.contentOffset.y < 0.f){
                scroll.contentOffset = CGPointMake(0.f, 0.f);
            }
        }
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    CGFloat LineTotalLength = SCREEN_WIDTH-15.f;
    CGFloat width = LineTotalLength/self.segmentBtns.count;
    CGFloat scrollMoveLength = scrollView.contentOffset.x;
    CGFloat scrollTotalLength = SCREEN_WIDTH * self.segmentBtns.count;
    CGFloat LineMoveLength = scrollMoveLength * LineTotalLength / scrollTotalLength;
    CGFloat x = LineMoveLength+15.f;

    CGRect rect = CGRectMake(x, self.segmentHeight-1, width-15, 1);
    self.underLine.frame = rect;
    
    //fmodf取余数
    if (fmodf(scrollView.contentOffset.x, SCREEN_WIDTH)==0.f) {
        UIButton *btn = [self viewWithTag:(scrollView.contentOffset.x/SCREEN_WIDTH +1)];
        [self clickSegmentBtn:btn];
    }
}

#pragma mark - Observer
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(__unused id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if (context == &ZWVerticallyScrollViewContext) {

        CGFloat offsetY = self.showingScrollView.contentOffset.y+self.topViewHeight;
        CGFloat segOffsetY = offsetY - self.scrollY;
        self.scrollY = offsetY;
//        NSLog(@"offsetY:%f,segOffsetY:%f",offsetY,segOffsetY);
        //topView联动
        CGRect headRect = self.topView.frame;
        headRect.origin.y -= segOffsetY;
        self.topView.frame = headRect;

        //segmentView联动，处理悬浮效果
        if (offsetY > self.topViewHeight) {
            self.segmentView.frame = CGRectMake(0, 64.f, SCREEN_WIDTH, self.segmentHeight);
            self.showingScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            self.showingScrollView.showsVerticalScrollIndicator = YES;
        } else {
            self.segmentView.frame = CGRectMake(0, CGRectGetMaxY(self.topView.frame), SCREEN_WIDTH, self.segmentHeight);
            self.showingScrollView.contentInset = UIEdgeInsetsMake(self.topViewHeight, 0, 0, 0);
            self.showingScrollView.showsVerticalScrollIndicator = NO;
        }
    }
}

#pragma mark - setter
- (void)setSegmentBtns:(NSArray *)segmentBtns{
    _segmentBtns = segmentBtns;
    [segmentBtns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = obj;
        btn.tag = idx+1;
        [btn addTarget:self action:@selector(clickSegmentBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.segmentView addSubview:btn];
        if (idx == 0) {
            [btn setSelected:YES];
        }
    }];
}

- (void)setTopView:(UIView *)topView{
    _topView = topView;
    [self addSubview:_topView];
}

- (void)setContentViews:(NSArray *)contentViews{
    _contentViews = contentViews;
    __block CGFloat x = 0;
    [self.contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIScrollView *scrollView = obj;
        scrollView.contentInset = UIEdgeInsetsMake(self.topViewHeight, 0, 0, 0);
        scrollView.contentOffset = CGPointMake(0, -self.topViewHeight);
        scrollView.frame = CGRectMake(x, self.segmentHeight, SCREEN_WIDTH, SCREEN_HEIGHT-self.segmentHeight-64.f);
        
        //采用KVO方式监听滚动，是为了更好的封装此控件->防止contentViews的delegate冲突
        [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:ZWVerticallyScrollViewContext];
        [self.bgScrollView addSubview:scrollView];
        x += SCREEN_WIDTH;
    }];
}

- (void)setSplitLineColor:(UIColor *)splitLineColor{
    _splitLineColor = splitLineColor;
    _splitLine0.backgroundColor = splitLineColor;
    _splitLine1.backgroundColor = splitLineColor;
}

#pragma mark - getter
- (UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_contentViews.count, 0);
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.bounces = NO;
        _bgScrollView.delegate = self;
        [self addSubview:_bgScrollView];
    }
    return _bgScrollView;
}

- (UIView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), SCREEN_WIDTH, self.segmentHeight)];
        _segmentView.backgroundColor = [UIColor whiteColor];
        //添加分割线
        _splitLine0 = [[UIView alloc] initWithFrame:CGRectMake(15, -0.3, SCREEN_WIDTH-30, 0.3)];
        _splitLine0.backgroundColor = ZWColor_SplitGray;
        [_segmentView addSubview:_splitLine0];
        _splitLine1 = [[UIView alloc] initWithFrame:CGRectMake(15, self.segmentHeight, SCREEN_WIDTH-30, 0.3)];
        _splitLine1.backgroundColor = ZWColor_SplitGray;
        [_segmentView addSubview:_splitLine1];

        [self addSubview:_segmentView];
    }
    return _segmentView;
}

- (UIScrollView *)showingScrollView{
    if (!_showingScrollView) {
        _showingScrollView = [UIScrollView new];
    }
    CGFloat bgOffsetX = _bgScrollView.contentOffset.x;
    int currentPage = (bgOffsetX+SCREEN_WIDTH*0.5)/SCREEN_WIDTH;
    [self.contentViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (currentPage == idx) {
            _showingScrollView = self.contentViews[idx];
            *stop = YES;
        }
    }];
    return _showingScrollView;
}

- (UIView *)underLine{
    if (!_underLine) {
        _underLine = [UIView new];
        _underLine.backgroundColor = themeColor;
        [self.segmentView addSubview:_underLine];
    }
    return _underLine;
}

- (void)dealloc{
    for(UIScrollView *v in self.contentViews) {
        [v removeObserver:self forKeyPath:@"contentOffset" context:&ZWVerticallyScrollViewContext];
    }
}

@end
