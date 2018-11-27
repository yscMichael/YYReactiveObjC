//
//  YYCalculateModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/26.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYCalculateModel.h"

@implementation YYCalculateModel
//加法
- (YYCalculateModel *(^)(int))add
{
    return ^YYCalculateModel *(int value){
        self.result += value;//计算结果
        return self;//返回自身
    };
}
@end
