//
//  YYBlockBasicController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/25.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYBlockBasicController.h"
#import "YYBlockModel.h"

@interface YYBlockBasicController ()

@end

@implementation YYBlockBasicController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    YYBlockModel *blockModel = [[YYBlockModel alloc] init];
    //正常
//    blockModel.eat;


    //把原来的int age = [stu age]替换成了int age = stu.age。
    //这两种写法又是完全等价的，stu.age并不是直接访问stu对象的成员变量age，
    //而是编译器遇到int age = stu.age的时候会自动将代码展开成int age = [stu age]
}

//一、基础语法
//
//
//
//
//
//
//二、Block变量
//
//
//
//三、Block当作函数参数
//
//
//
//四、Block当作函数返回值
//
//
//
//
//五、Block与点语法
//
//
//
//
//
//
//六、截获自动变量
//
//
//
//
//


#pragma mark - Getter And Setter


@end
