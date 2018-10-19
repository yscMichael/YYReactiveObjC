//
//  YYMainViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/19.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYMainViewController.h"

@interface YYMainViewController ()

@end

@implementation YYMainViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"进入首个界面------------");

    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, 50)];
    tempView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tempView];
}


@end
