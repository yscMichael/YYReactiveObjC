//
//  RACButtonViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/31.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "RACButtonViewController.h"
#import <ReactiveObjC.h>

@interface RACButtonViewController ()
@property (nonatomic ,copy) NSString *firstText;
@property (nonatomic ,copy) NSString *secondText;

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UITextField *firstTextField;
@property (nonatomic,strong) UITextField *secondTextField;
@end

@implementation RACButtonViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self initView];
    [self addEvents];
}

- (void)initData
{
    self.firstText = @"";
    self.secondText = @"";
    self.button.enabled = NO;
}

- (void)initView
{
    [self.view addSubview:self.button];
    [self.view addSubview:self.firstTextField];
    [self.view addSubview:self.secondTextField];
    [self layoutViews];
}

- (void)layoutViews
{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(64);
        make.centerX.equalTo(self.view).with.offset(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
    [self.firstTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view).with.offset(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
    [self.secondTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstTextField.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view).with.offset(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(50);
    }];
}

- (void)addEvents
{
    WeakSelf;
    //1、监听按钮状态
    [RACObserve(self.button, enabled) subscribeNext:^(id x) {
        NSLog(@"按钮当前状态 = %@",x);
        NSString *contentString = ([x intValue] == 0) ? @"输入数字相同,按钮可点击" : @"按钮可以点击";
        [weakSelf.button setTitle:contentString forState:UIControlStateNormal];
    }];

    //2、改变按钮状态
    RAC(self.button,enabled) = [RACSignal combineLatest:@[self.firstTextField.rac_textSignal,self.secondTextField.rac_textSignal] reduce:^id _Nonnull(NSString *firstText , NSString *secondText){
        return @([firstText isEqualToString:secondText] &&
                (![firstText isEqualToString:@""]) &&
                (![secondText isEqualToString:@""]));
    }];
    //3、点击按钮
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了按钮,改变颜色");
        weakSelf.button.backgroundColor = [UIColor randomColor];
    }];
}

#pragma mark - Getters And Setters
- (UIButton *)button
{
    if (!_button)
    {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, 100, 50)];
        [_button setTitle:@"输入数字相同,按钮可点击" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor blueColor]];
    }
    return _button;
}

- (UITextField *)firstTextField
{
    if (!_firstTextField)
    {
        _firstTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _firstTextField.placeholder = @"请输入数字";
        _firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _firstTextField;
}

- (UITextField *)secondTextField
{
    if (!_secondTextField)
    {
        _secondTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _secondTextField.placeholder = @"请输入数字";
        _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _secondTextField;
}

@end
