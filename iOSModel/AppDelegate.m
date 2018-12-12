//
//  AppDelegate.m
//  iOSModel
//
//  Created by yanghuan on 2018/8/3.
//  Copyright © 2018年 wyChirs. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	TestViewController *vc = [[TestViewController alloc] init];
	
	self.window.rootViewController = vc;
	
	return YES;
}

/*
  // 可用于通知跳转 对应控制器
 		UIViewController *rootVC = [[UIViewController alloc] init];
 		if ([rootVC isKindOfClass:[MainTabBarController class]]) {
 			MainTabBarController *mainTabVC = (MainTabBarController *)rootVC;
 			//创建你要进入的控制器
 			StuHomeWorkController *workVc = [[StuHomeWorkController alloc] init];
 			UINavigationController *nav = mainTabVC.selectedViewController;
 			if (![nav.visibleViewController isKindOfClass:[StuHomeWorkController class]]) {//这里如果要直接推
 				//如果是在你这个页面，则不需要push,反之push
 				[nav pushViewController:workVc animated:YES];
 			}
 		}
 */

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
