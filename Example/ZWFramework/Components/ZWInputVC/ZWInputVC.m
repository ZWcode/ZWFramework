//
//  InputVC.m
//  GoodFuture
//
//  Created by 曾威 on 16/3/14.
//  Copyright © 2016年 曾威. All rights reserved.
//

#import "ZWInputVC.h"
#import "MBProgressHUD+MJ.h"

typedef void(^inputBlock)(NSString *inputContent);

@interface ZWInputVC ()

@property (nonatomic, strong) UIView      *inputBackgroud;/**<输入框背景*/
@property (nonatomic, strong) UILabel     *wordsNumLabel;/**<显示当前字数的label*/
@property (nonatomic, copy)   inputBlock  inputblock;

@end

@implementation ZWInputVC
+ (instancetype)inputWithTitle:(NSString *)title content:(NSString *)content CallBack:(inputBlock)block{
    return [[ZWInputVC alloc] initWithTitle:title content:content inputCallBack:block];
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content inputCallBack:(inputBlock)block{
    if (self = [super init]) {
        self.inputblock = block;
        self.title = title;
        self.inputView.text = content;
        [self.view setBackgroundColor:RGBColor(235, 235, 241, 1)];
        [self addCompleteBtn];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputChange) name:UITextViewTextDidChangeNotification object:nil];
        [self setupView];
        [self inputChange];
#warning 多文字初始化显示,iOS8异常
    }
    return self;
}

- (void)addCompleteBtn{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(complete)];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)complete{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
    self.inputblock(self.inputView.text);//传值
}

- (void)inputChange{
    [self.inputView layoutIfNeeded];

    //计算宽度、处理换行时增加高度
    if (self.inputView.contentSize.height>37.f) {
        //限制最大高度
        CGFloat maxHeight = SCREEN_HEIGHT - 100 - 216 - 64;
        if (self.inputView.frame.size.height > maxHeight) {
            return;
        }
        [self.inputView remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.height.equalTo(self.inputView.contentSize.height);
            make.top.equalTo(90);
            make.width.equalTo(SCREEN_WIDTH-25);
        }];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.inputView layoutIfNeeded];
        }];
    }

    //如果设置了maxBytes
    if (self.maxBytes!=0) {
        //如果超过了字数
        if ([self getStringBytes:self.inputView.text]>self.maxBytes) {
            NSString *showText = [NSString stringWithFormat:@"不能超过%d字哦",self.maxBytes];
            [MBProgressHUD showText:showText];
            self.inputView.text = [self.inputView.text substringWithRange:NSMakeRange(0, self.inputView.text.length-1)];
        }
        //刷新当前字数
        self.wordsNumLabel.text = [NSString stringWithFormat:@"%ld/%d",(long)[self getStringBytes:self.inputView.text],self.maxBytes];
        return ;
    }

    //如果设置了maxLength
    if (self.maxLength!=0) {
        //如果超过了字数
        if ([self getStringBytes:self.inputView.text]>self.maxLength*3) {
            NSString *showText = [NSString stringWithFormat:@"不能超过%d字哦",self.maxLength];
            [MBProgressHUD showText:showText];
            self.inputView.text = [self.inputView.text substringWithRange:NSMakeRange(0, self.inputView.text.length-1)];
        }
        //刷新当前字数
        self.wordsNumLabel.text = [NSString stringWithFormat:@"%d/%d",(int)[self getStringBytes:self.inputView.text]/3,self.maxLength];
    }
}

//得到字节数函数
- (NSInteger)getStringBytes:(NSString*)strtemp
{
    return [strtemp lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.inputView endEditing:YES];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.maxBytes!=0) {
        self.wordsNumLabel.text = [NSString stringWithFormat:@"%ld/%d",[self getStringBytes:self.inputView.text],self.maxBytes];
        return;
    }
    if (self.maxLength!=0) {
        self.wordsNumLabel.text = [NSString stringWithFormat:@"%d/%d",(int)[self getStringBytes:self.inputView.text]/3,self.maxLength];
    }
}

- (void)setupView{
    
    //创建输入框
    [self.inputView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.height.greaterThanOrEqualTo(37);
        make.top.equalTo(90);
        make.width.equalTo(SCREEN_WIDTH-25);
    }];
    
    //输入框背景
    [self.inputBackgroud makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.centerY.equalTo(self.inputView);
        make.height.equalTo(self.inputView).offset(16);
    }];
    
    //显示字数的label
    [self.wordsNumLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputBackgroud.bottom).offset(8);
        make.right.equalTo(-20);
    }];
}

#pragma mark - setter && getter
- (UIView *)inputBackgroud{
    if (!_inputBackgroud) {
        _inputBackgroud = [UIView new];
        [_inputBackgroud setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_inputBackgroud];
        [self.view bringSubviewToFront:self.inputView];
    }
    return _inputBackgroud;
}

- (UITextView *)inputView{
    if (!_inputView) {
        _inputView = [UITextView new];
        _inputView.backgroundColor = [UIColor clearColor];
        _inputView.font = ZWFont_17;
        [_inputView becomeFirstResponder];
        [self.view addSubview:_inputView];
    }
    return _inputView;
}

- (UILabel *)wordsNumLabel{
    if (!_wordsNumLabel) {
        _wordsNumLabel = [UILabel labelWithTitle:nil font:ZWFont_14 titleColor:[UIColor blackColor]];
        [self.view addSubview:_wordsNumLabel];
    }
    return _wordsNumLabel;
}

- (void)dealloc{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}
@end
