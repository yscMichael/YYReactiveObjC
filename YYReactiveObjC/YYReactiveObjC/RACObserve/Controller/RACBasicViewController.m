//
//  RACBasicViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/31.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "RACBasicViewController.h"
#import "YYModel.h"

@interface RACBasicViewController ()
//这里主要演示监听username的变化
@property (nonatomic ,copy) NSString *username;
//这里演示监听模型属性的变化
@property (nonatomic,strong) YYModel *yyModel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation RACBasicViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self monitorTextFieldChange];
    [self monitorTextFieldChangeAndFilter];
//    [self monitorYYModelPassword];
}

#pragma mark - 监听username属性变化
- (void)monitorTextFieldChange
{
    WeakSelf;
    //1、监听username这个属性
    [RACObserve(self,username) subscribeNext:^(NSString *newName) {
        NSLog(@"username = %@", newName);
        weakSelf.contentLabel.text = newName;
    }];
    //2、textField发生变化、然后赋值给username
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"textField = %@",x);
        weakSelf.username = x;
    }];
}

#pragma mark - 监听username属性变化并进行过滤
- (void)monitorTextFieldChangeAndFilter
{
    WeakSelf;
    //1、监听并过滤username这个属性
    [[RACObserve(self, username) filter:^BOOL(NSString *newName) {
        return [newName hasPrefix:@"j"];
    }] subscribeNext:^(NSString *newName) {
         NSLog(@"newName = %@", newName);
         weakSelf.contentLabel.text = newName;
    }];
    //2、textField发生变化、然后赋值给username
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"textField = %@",x);
        weakSelf.username = x;
    }];
}

#pragma mark - 监听yyModel的password属性
- (void)monitorYYModelPassword
{
    WeakSelf;
    //1、监听username这个属性
    [RACObserve(self.yyModel,password) subscribeNext:^(NSString *newName) {
        NSLog(@"password = %@", newName);
        weakSelf.contentLabel.text = newName;
    }];
    //2、textField发生变化、然后赋值给username
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"textField = %@",x);
        weakSelf.yyModel.password = x;
    }];
}

#pragma mark - Getter And Setter
- (YYModel *)yyModel
{
    if (!_yyModel)
    {
        _yyModel = [[YYModel alloc] init];
    }
    return _yyModel;
}

//备注:
//RACObserve 用来监听某单个属性、或者某个模型属性

@end
