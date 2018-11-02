//
//  RACSignalViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/1.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "RACSignalViewController.h"

@interface RACSignalViewController ()
//姓名
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic ,copy) NSString *name;
//密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic ,copy) NSString *passWord;
//按钮
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation RACSignalViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self simpleRAC];
    [self advancedRAC];
}

#pragma mark - RAC简单实用
//RAC(对象，对象的属性) = (一个信号);
//比如：RAC(btn,enable) = (RACSignal) 按钮的enable等于一个信号
- (void)simpleRAC
{
    RAC(self.nameTextField,text) = self.passwordTextField.rac_textSignal;
}

#pragma mark - RAC进阶使用
- (void)advancedRAC
{
    RAC(self,name) = self.nameTextField.rac_textSignal;
    RAC(self,passWord) = self.passwordTextField.rac_textSignal;
    RAC(self.button,enabled) = [RACSignal combineLatest:@[RACObserve(self, name),RACObserve(self, passWord)]
                                                 reduce:^(NSString *name, NSString*passWord){
                        return @(![name isEqualToString:@""] && ![passWord isEqualToString:@""]);
    }];
}

@end
