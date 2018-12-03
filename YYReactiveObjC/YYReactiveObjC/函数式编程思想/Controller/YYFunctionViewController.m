//
//  YYFunctionViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/12/3.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYFunctionViewController.h"
#import "YYCaculatorModel.h"

@interface YYFunctionViewController ()

@end

@implementation YYFunctionViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    YYCaculatorModel *calculateModel = [[YYCaculatorModel alloc] init];
    int result = [[calculateModel calculate:^int(int result) {
        //这里将计算结果暴漏给你了、你可以对结果进行任意操作
        //不像链式编程那样、直接将计算结果封装
        result += 5;
        result *= 5;
        return result;
    }] result] ;

    NSLog(@"result = %d",result);
}

//1、函数编程思想:
//Masonry有一点函数编程式思想,方法中传了一个block(参数是make),里面用了链式编程思想
//函数式编程本质:就是往方法中传入Block,方法中嵌套Block调用，把代码聚合起来管理
//函数式编程特点：每个方法必须有返回值（本身对象）,把函数或者Block当做参数,block参数（需要操作的值）block返回值（操作结果）
//2、这里计算器的设计原理与链式编程的区别:
//2.1、链式编程思想
//    int result = [NSObject makeCaculator:^(YYCalculateModel *make) {
//                      make.add(1).add(2).add(3);
//                  }];
//    这里的结果是一次性返回给你,计算方法被隐藏在链式方法中
//    
//
//


@end
