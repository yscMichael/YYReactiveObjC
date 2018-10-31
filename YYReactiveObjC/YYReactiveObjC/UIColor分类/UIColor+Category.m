//
//  UIColor+Category.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/31.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
#pragma mark - 取随机颜色
+ (UIColor *)randomColor
{
    UIColor *color;
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    return color;
}

@end
