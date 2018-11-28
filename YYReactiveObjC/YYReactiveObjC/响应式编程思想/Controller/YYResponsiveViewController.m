//
//  YYResponsiveViewController.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYResponsiveViewController.h"
#import "YYPersonModel.h"
#import "YYPersonSonModel.h"

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
    //2.1、由以上原理可知,重写set方法自己监听
    //     重写方法有两种途径:1、分类
    //                     2、写一个继承它的子类

    //2.2、这里用分类不好,原因如下:
    //     分类一旦有这个方法,会把自己当前类的方法覆盖掉,但是你需要在当前类对数据进行处理;所以,分类覆盖你的方法,不好
    //     因此,系统的KVO也是通过自定义一个分类来实现的

    //2.3、监听方法的本质:并不需要修改方法的实现,仅仅想判断下有没有调用

    //3、由此引入KVO底层实现原理
    //1.自定义Person类的子类(NSKVONotifying_Person)
    //2.重写setName,在内部恢复父类做法(调用[super ---]、保证了父类属性值发生变化),通知观察者(子类调用observeValueForKeyPath)
    //3.如何让外界调用自定义Person类的子类方法
    //  解决:修改当前对象的isa指针,指向自定义子类NSKVONotifying_Person
    //  补充:调用方法其实是根据isa指针调用的、isa指针指向哪里,就调用哪个方法.
    //  验证:打断点查看系统本身帮忙创建的子类的类型

    //简洁版
    // 1.自定义NSKVONotifying_Person子类
    //   备注:这里动态添加类方法,这里为了简化,直接创建一个子类YYKVONotifying_Person
    // 2.利用运行时,将观察者保存到当前对象
    //   备注:动态添加属性
    // 3.如何让外界调用自定义Person类的子类方法,修改当前对象的isa指针,指向NSKVONotifying_Person
    // 4.在子类,重写setName,在内部恢复父类做法;获取观察者,通知观察者
    //   备注:查看YYKVONotifying_Person方法(动态获取属性)

    //4、为了更好的理解KVO,自己实现一个KVO
    //  参照系统KVO实现+3、由此引入KVO底层实现原理
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
