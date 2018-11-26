//
//  YYBlockModel.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/25.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYBlockModel : NSObject
//吃饭
- (NSString *)eat;
//喝
- (void(^)(NSString *string))drink;
@end
