//
//  YYChainViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/26.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYChainViewController.h"
#import "YYCalculateModel.h"

@interface YYChainViewController ()

@end

@implementation YYChainViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    //计算器编程实现
    YYCalculateModel *calculate = [[YYCalculateModel alloc] init];
    calculate.add(1).add(2);
}

//总结:
//最终目标:
//  YYCalculateModel *calculate = [[YYCalculateModel alloc] init];
//  calculate.add(1).add(2);
//
//思路分析:
//  1、想实现.add(1),则方法返回值必须是block
//  2、想接二连三的.add(1).add(2),则block里面的返回值必须是YYCalculateModel
//  3、想要计算出总的数值,则YYCalculateModel必须有一个属性保存结果
//


@end
