//
//  RACBasicViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/31.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "RACBasicViewController.h"

@interface RACBasicViewController ()
//这里主要演示监听username的变化
@property (nonatomic ,copy) NSString *username;
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
}

#pragma mark - 监听TextField变化
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

#pragma mark - 对变化的数值进行过滤
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




@end
