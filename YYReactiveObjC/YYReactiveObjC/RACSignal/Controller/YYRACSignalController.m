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
    //RACSignal使用步骤
    //1.创建信号+ (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
    //2.发送信号- (void)sendNext:(id)value
    //3.订阅信号(才会激活信号)- (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock

    //RACSignal底层原理
    //1.创建信号,首先把didSubscribe保存到信号中，还不会触发
    //2.当信号被订阅，也就是调用signal的subscribeNext:nextBlock
    //2.1 subscribeNext内部会创建订阅者subscriber，并且把nextBlock保存到subscriber中。
    //2.2 subscribeNext内部会调用siganl的didSubscribe(RACDisposable调用)
    //3.siganl的didSubscribe中调用[subscriber sendNext:@1];
    //3.1.sendNext底层其实就是执行subscriber的nextBlock
    

    //具体执行过程:
    //1、创建信号
    //创建信号这个方法内部会帮我们创建一个RACDynamicSignal并且保存一个didSubscribe的block
    //didSubscribe会成为signal的一个属性
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"创建信号量");
        //每当有订阅者订阅信号(执行subscribeNext)、就会调用当前block(didSubscribe)、否则永远不执行
        //3、发布信息
        [subscriber sendNext:@"I'm send next data"];//一定会执行父类的方法
        NSLog(@"那我啥时候运行");

        //取消发送信号两种方式:
        //如果不在发送，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。
        //1、订阅者取消发送信号
        [subscriber sendCompleted];

        //2、RACDisposable取消订阅信号
        return [RACDisposable disposableWithBlock:^{

            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。

            // 执行完Block后，当前信号就不在被订阅了。

            NSLog(@"信号被销毁");

        }];
    }];
    //2、订阅信号量
    //此时还会创建一个订阅者RACSubscriber
    //订阅者RACSubscriber拥有nextBlock、signal、disposable
    //此时会运行signal的didSubscribe(block)
    //此时信号称为热信号,不被订阅就是冷信号、冷信号中的didSubscribe永远不会执行(nextBlock也不会执行)
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"收到信号 = %@",x);
    }];
}

//疑问:
//RACSubscriber是协议、协议还能声明.h和.m

@end
