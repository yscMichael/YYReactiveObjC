//
//  YYPersonModel.h
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/11/27.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYPersonModel : NSObject
{
    @public
    NSString *_name;//这样name就变成公有属性了,并且@property不会帮你生成_属性(只会帮你生成get和set方法)
                    //此时,外界访问属性,就可以通过 -> 来访问了
                    //使用->时,不会调用set和get方法
}
//名字
//默认是私有属性
@property (nonatomic ,copy) NSString *name;
@end
