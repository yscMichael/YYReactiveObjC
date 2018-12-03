//
//  YYCaculatorModel.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/12/3.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYCaculatorModel : NSObject
//结果
@property (nonatomic,assign) int result;
//计算方法
- (instancetype)calculate:(int(^)(int result))calculateBlock;
@end
