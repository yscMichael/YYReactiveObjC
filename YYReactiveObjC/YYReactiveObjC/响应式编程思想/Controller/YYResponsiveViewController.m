//
//  YYResponsiveViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYResponsiveViewController.h"
#import "YYPersonModel.h"
#import "YYPersonSonModel.h "

@interface YYResponsiveViewController ()
@property (nonatomic,strong) YYPersonModel *person;
@end

@implementation YYResponsiveViewController
#pragma mark - Cycle Life
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //1、KVO
    //KVO实现原理
    //KVO的本质就是监听一个对象有没有调用set方法
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    //2、自定义
    //由以上原理可知,重写set方法自己监听
    //重写方法有两种途径:1、分类
    //               2、写一个继承它的子类

    //这里用分类不好,原因如下:
    //分类一旦有这个方法,会把自己当前类的方法覆盖掉,但是你需要在当前类对数据进行处理;所以,分类覆盖你的方法,不好

    //监听方法的本质:并不需要修改方法的实现,仅仅想判断下有没有调用

    //3、由此引入KVO底层实现原理
    //1.自定义Person类的子类(NSKVONotifying_Person)
    //2.重写setName,在内部恢复父类做法,通知观察者
    //3.如何让外界调用自定义Person类的子类方法(补充:调用方法其实是根据isa指针调用的)
    //  解决:修改当前对象的isa指针,指向自定义子类NSKVONotifying_Person
    //  验证:打断点查看系统本身帮忙创建的子类的类型
    //4.
}

//监听属性
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"name = %@",self.person.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    i ++;
    self.person.name = [NSString stringWithFormat:@"%d",i];
    //此时KVO监听不到的,因为这个不会调用set方法,所以不会打印的
    //self.person->_name = [NSString stringWithFormat:@"%d",i];
}

#pragma mark - Getter And Setter
- (YYPersonModel *)person
{
    if (!_person)
    {
        _person = [[YYPersonModel alloc] init];
    }
    return _person;
}

@end
