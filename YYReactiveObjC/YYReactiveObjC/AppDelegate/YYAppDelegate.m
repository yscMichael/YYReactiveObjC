//
//  YYAppDelegate.m
//  YYReactiveObjC
//
//  Created by 杨世川 on 2018/10/19.
//  Copyright © 2018年 winwayworld. All rights reserved.
//

#import "YYAppDelegate.h"
#import "YYMainViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface YYAppDelegate ()

@end

@implementation YYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initRootCtrl];
    [self setKeyboard];
    return YES;
}

#pragma mark - 设置子控制器
- (void)initRootCtrl
{
    YYMainViewController *viewCtrl = [[YYMainViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewCtrl];
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

#pragma mark - 设置键盘
- (void)setKeyboard
{
    IQKeyboardManager * manager = [IQKeyboardManager sharedManager];
    [manager setEnable:YES];
    [manager setEnableAutoToolbar:NO];
    [manager setShouldResignOnTouchOutside:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
