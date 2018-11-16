//
//  YYRACSignalController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/16.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYRACSignalController.h"

@interface YYRACSignalController ()

@end

@implementation YYRACSignalController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //1、创建信号
    //创建信号这个方法内部会帮我们创建一个RACDynamicSignal并且保存一个didSubscribe的block
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"创建信号量");
        //3、发布信息
        //当我们的订阅者发送消息的时候就会调用订阅信号的block
        [subscriber sendNext:@"I'm send next data"];
        NSLog(@"那我啥时候运行");
        return nil;
    }];
    //2、订阅信号量
    //订阅信号之后就会运行创建信号的block
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"收到信号 = %@",x);
    }];
}


@end
