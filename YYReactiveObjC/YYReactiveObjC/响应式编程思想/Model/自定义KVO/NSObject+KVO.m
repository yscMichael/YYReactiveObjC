//
//  NSObject+KVO.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/28.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>
#import "YYKVONotifying_Person.h"

NSString *const observerKey = @"observer";
@implementation NSObject (KVO)
//监听某个对象属性
//谁用就监听谁
- (void)yy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    /*
     // 1.自定义NSKVONotifying_Person子类
     //   备注:这里动态添加类方法,这里为了简化,直接创建一个子类YYKVONotifying_Person
     // 2.重写setName,在内部恢复父类做法,通知观察者
     //   备注:查看YYKVONotifying_Person方法
     // 3.如何让外界调用自定义Person类的子类方法,修改当前对象的isa指针,指向NSKVONotifying_Person
     */

    //把观察者保存到当前对象、方便子类调用
    objc_setAssociatedObject(self, (__bridge const void *)(observerKey), observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //3.修改对象isa指针
    object_setClass(self, [YYKVONotifying_Person class]);
}

//详细解释:
//1.自定义Person类的子类(NSKVONotifying_Person)
//2.重写setName,在内部恢复父类做法(调用[super ---]、保证了父类属性值发生变化),通知观察者(子类调用observeValueForKeyPath)
//3.如何让外界调用自定义Person类的子类方法
//  解决:修改当前对象的isa指针,指向自定义子类NSKVONotifying_Person
//  补充:调用方法其实是根据isa指针调用的、isa指针指向哪里,就调用哪个方法.
//  验证:打断点查看系统本身帮忙创建的子类的类型

@end
