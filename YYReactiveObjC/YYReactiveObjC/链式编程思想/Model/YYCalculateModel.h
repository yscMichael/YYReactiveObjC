//
//  YYCalculateModel.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/26.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYCalculateModel : NSObject
//计算结果
@property (nonatomic,assign) int result;
//加法
- (YYCalculateModel *(^)(int))add;
@end
