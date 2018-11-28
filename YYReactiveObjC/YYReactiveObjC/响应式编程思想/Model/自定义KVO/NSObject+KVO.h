//
//  NSObject+KVO.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/28.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
- (void)yy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
