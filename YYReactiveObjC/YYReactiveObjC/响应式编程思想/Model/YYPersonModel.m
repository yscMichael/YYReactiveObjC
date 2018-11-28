//
//  YYPersonModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYPersonModel.h"

@implementation YYPersonModel
- (void)setName:(NSString *)name
{
    _name = name;
    NSLog(@"调用set方法了");
}
@end
