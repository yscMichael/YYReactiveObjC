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

    //1、验证点语法
    YYBlockModel *blockModel = [[YYBlockModel alloc] init];
    NSString *eatStringOne = [blockModel eat];
    NSLog(@"eatStringOne = %@",eatStringOne);
    NSString *eatStringTwo = blockModel.eat;
    NSLog(@"eatStringTwo = %@",eatStringTwo);

    //2、block调用方法
    NSString *(^block)(NSString *string) = ^NSString *(NSString *string){
        return [NSString stringWithFormat:@"+%@+",string];
    };
    NSString *tempString = block(@"2");
    NSLog(@"tempString = %@",tempString);

    //3、返回值是block
    void(^tempBlock)(NSString *string) = blockModel.drink;
    tempBlock(@"2");
    //等价于
    blockModel.drink(@"3");
}

//一、Block语法(这里是语法,语法,语法!!!)
//1、Block被称为"带有自动变量值的匿名函数",Block也是OC对象
//2、与C语言相比,仅有两点不同
//   a、没有函数名
//   b、带有"^"
//3、Block语法形式:
//   a、^ 返回值类型 (参数列表) {表达式}
//      ^int (int count){return count + 1;}
//   b、^ (参数列表) {表达式}
//      ^(int count){return count + 1;}
//      省略返回值类型:1、如果有return,就使用返回值类型
//                  2、如果没有返回值,就使用void
//                  3、有多个return,返回值类型必须相同
//   c、^ {表达式}
//      ^{NSLog(@"我是Block")};
//      等价于:
//      ^void (void){NSLog(@"我是Block")};
//
//二、Block类型变量(这是变量,变量,变量!!!)
//Block类型变量类似于"函数指针"
//1、定义形式
//   返回值类型(^Block名称)(参数类型) = ^返回值类型(参数列表) {表达式}
//   int(^blk)(int) = ^int(int count){return count + 1;}
//   int(^blk)(int,int) = ^(int count,int rate){return count + rate;}
//
//2、typedef定义Block
// typedef int (^blk_t)(int);
//
//三、Block当作函数参数
//   - (void)fun(int(^)(int))blk
//   {
//
//   }
//
//   等价于:
//   - (void)fun(blk_t)blk
//   {
//
//   }
//
//四、Block当作函数返回值
//   - (int(^)(int))fun
//   {
//     return ^(int count){return count + 1;}
//   }
//
//   等价于:
//   - (blk_t)fun
//   {
//       return ^(int count){return count + 1;}
//   }
//
//五、Block与点语法
//   1、某个类调用
//      比如这里YYBlockModel调用eat方法:[blockModel eat]
//                             等价于:blockModel.eat
//      解释:
//      blockModel.eat并不是直接访问blockModel对象的成员变量eat,
//      而是编译器遇到blockModel.eat的时候会自动将代码展开成[blockModel eat]
//
//   2、block使用
//      2.1、比如:
//      NSString *(^block)(NSString *string) = ^NSString *(NSString *string){
//              return [NSString stringWithFormat:@"+%@+",string];
//      };
//      NSString *tempString = block(@"2");
//      NSLog(@"tempString = %@",tempString);
//
//      2.2、
//      假如我调用一个方法,返回值是block,会有什么效果
//      YYBlockModel:  - (void(^)(NSString *string))drink
//                     - (void(^)(NSString *string))drink
//                       {
//                          return ^(NSString *string){
//                                NSLog(@"返回值是block = %@",string);
//                              };
//                       }
//
//      调用方法:
//      void(^tempBlock)(NSString *string) = blockModel.drink;
//      tempBlock(@"2");
//      等价于
//      blockModel.drink(@"3");
//
//六、截获自动变量
//    需要着重分析Block原理！！！
//

#pragma mark - Getter And Setter


@end
