//
//  YYCaculatorModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/12/3.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYCaculatorModel.h"

@implementation YYCaculatorModel
#pragma mark - 计算方法
- (instancetype)calculate:(int(^)(int))calculateBlock
{
    _result = calculateBlock(_result);
    return self;
}
@end
