//
//  YYPersonModel+Category.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYPersonModel+Category.h"

@implementation YYPersonModel (Category)
- (void)setName:(NSString *)name
{
    _name = name;
    NSLog(@"分类调用了set方法");
}
@end
