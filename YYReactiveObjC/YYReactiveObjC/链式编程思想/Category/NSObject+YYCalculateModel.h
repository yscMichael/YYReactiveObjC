//
//  NSObject+YYCalculateModel.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYCalculateModel;

@interface NSObject (YYCalculateModel)
+ (int)makeCaculator:(void(^)(YYCalculateModel *make))make;
@end
