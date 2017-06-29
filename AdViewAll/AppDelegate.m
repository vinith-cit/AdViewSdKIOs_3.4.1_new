//
//  AppDelegate.m
//  AdViewAll
//
//  Created by ZhongyangYu on 14-8-29.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AdViewConfigStore.h"
#import "AdViewConst.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController * vc = [[ViewController alloc] init];
    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nvc;
    
    AdViewConfigStore *cfg = [AdViewConfigStore sharedStore];
    
    [cfg requestConfig:@[ADBANNERKEY] sdkType:AdViewSDKType_Banner];
    [cfg requestConfig:@[ADINSTLKEY] sdkType:AdViewSDKType_Instl];
    [cfg requestConfig:@[ADSPREADSCREENKEY] sdkType:AdViewSDKType_SpreadScreen];
    [cfg requestConfig:@[ADNATIVEKEY] sdkType:AdViewSDKType_Native];
    [cfg requestConfig:@[ADVIDEOKEY] sdkType:AdViewSDKType_Video];
    
    [self.window makeKeyAndVisible];
    self.manager = [AdSpreadScreenManager managerWithAdSpreadScreenKey:ADSPREADSCREENKEY WithDelegate:self];
    //SDK20141503031138ax4lwzw4h9y5bl7
    [self.manager requestAdSpreadScreenView:self.window.rootViewController];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark AdSpreadScreenManagerDelegate
/**
 * 信息回调
 */
- (void)adSpreadScreenManager:(AdSpreadScreenManager*)manager didGetEvent:(SpreadScreenEventType)eType error:(NSError*)error{
}

/**
 * 取得配置的回调通知
 */
- (void)adSpreadScreenDidReceiveConfig:(AdSpreadScreenManager*)manager {
    
}

/**
 * 配置全部无效或为空的通知
 */
- (void)adSpreadScreenReceivedNotificationAdsAreOff:(AdSpreadScreenManager*)manager {}

/**
 * 是否打开测试模式，缺省为NO
 */
- (BOOL)adSpreadScreenTestMode {
    return YES;
}

/**
 * 是否打开日志模式，缺省为NO
 */
- (BOOL)adSpreadScreenLogMode {
    return YES;
}

/**
 * 是否获取地理位置，缺省为NO
 */
- (BOOL)adSpreadScreenOpenGps {
    return NO;
}
/**
 * 是否使用html5广告，缺省为NO
 */
- (BOOL)adSpreadScreenUsingHtml5
{
    return NO;
}

- (UIWindow *)adSpreadScreenWindow {
    return self.window;
}

- (NSString *)adSpreadScreenLogoImgName {
    return @"Adview_Logo.jpg";
}

- (UIColor *)adSpreadScreenBackgroundColor {
    return [UIColor whiteColor];
}
@end
