//
//  AppDelegate.m
//  BackgroundDownload
//
//  Created by xiaoyu on 16/6/1.
//  Copyright © 2016年 Damon. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // iOS 8 设置系统通知
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    application.applicationIconBadgeNumber = 0 ;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler{

    self.backgroundURLSessionCompletionHandler = completionHandler;
    
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification*)notification{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LocalNotification" message:notification.alertBody delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    
    NSDictionary* dic = [[NSDictionary alloc]init];
    //这里可以接受到本地通知中心发送的消息
    dic = notification.userInfo;
    NSLog(@"user info = %@",[dic objectForKey:@"key"]);
    
    // 图标上的数字减1
    application.applicationIconBadgeNumber -= 1;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
