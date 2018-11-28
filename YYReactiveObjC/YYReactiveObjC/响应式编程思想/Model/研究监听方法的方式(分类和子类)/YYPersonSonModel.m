//
//  YYPersonSonModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYPersonSonModel.h"

@implementation YYPersonSonModel
- (void)setName:(NSString *)name
{
    [super setName:name];//还原系统方法
    NSLog(@"调用子类的set方法");//进一步处理
    //通知观察者
}
@end
