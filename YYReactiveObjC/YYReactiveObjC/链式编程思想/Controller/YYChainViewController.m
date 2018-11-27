//
//  YYChainViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/26.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYChainViewController.h"
#import "YYCalculateModel.h"
#import "NSObject+YYCalculateModel.h"

@interface YYChainViewController ()

@end

@implementation YYChainViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //1、计算器编程实现-初步
    YYCalculateModel *calculate = [[YYCalculateModel alloc] init];
    calculate.add(1).add(2);
    NSLog(@"result-1 = %d",calculate.result);

    //2、计算器编程实现-进阶
    int result = [NSObject makeCaculator:^(YYCalculateModel *make) {
        make.add(1).add(2).add(3);
    }];
    NSLog(@"result-2 = %d",result);
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
//  但是现在还是有一个问题,那就是calculate.add(1).add(2),不能直接返回值,而是调用calculate.result
//  这样还是违背了暴漏内部方法的原则,此时写另外一个方法,将calculate.result结果返回过来<模仿Masonry>
//  直接写一个分类
//
//  4、封装一个block,内部主要参数是YYCalculateModel,利用YYCalculateModel可以连续调用add方法,
//     然后获取到calculate.result,返回即可
//


@end
