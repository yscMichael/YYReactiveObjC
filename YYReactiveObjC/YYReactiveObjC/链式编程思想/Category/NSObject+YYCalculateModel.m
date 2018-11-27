//
//  NSObject+YYCalculateModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "NSObject+YYCalculateModel.h"
#import "YYCalculateModel.h"

@implementation NSObject (YYCalculateModel)
+ (int)makeCaculator:(void(^)(YYCalculateModel *make))make
{
    YYCalculateModel *calculateModel = [[YYCalculateModel alloc] init];
    make(calculateModel);
    return calculateModel.result;
}
@end
