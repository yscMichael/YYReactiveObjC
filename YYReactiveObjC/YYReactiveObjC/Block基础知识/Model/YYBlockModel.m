//
//  YYBlockModel.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/25.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYBlockModel.h"

@implementation YYBlockModel
//吃饭
- (NSString *)eat
{
    return @"吃饭";
}
//喝
- (void(^)(NSString *string))drink
{
    return ^(NSString *string){
        NSLog(@"返回值是block = %@",string);
    };
}
@end
