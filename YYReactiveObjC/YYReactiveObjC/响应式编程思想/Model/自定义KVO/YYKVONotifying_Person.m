//
//  YYKVONotifying_Person.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/28.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYKVONotifying_Person.h"
#import <objc/message.h>

extern NSString *const observerKey;

@implementation YYKVONotifying_Person
- (void)setName:(NSString *)name
{
    //2.重写setName,在内部恢复父类做法
    [super setName:name];

    //2.通知观察者--调用observeValueForKeyPath
    //需要父类YYPersonModel把观察者保存到当前对象
    //子类YYKVONotifying_Person获取观察者
    id obsetver = objc_getAssociatedObject(self, observerKey);
    [obsetver observeValueForKeyPath:@"name" ofObject:self change:nil context:nil];
}
@end
