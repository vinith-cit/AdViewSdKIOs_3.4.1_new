//
//  AppDelegate.h
//  AdViewAll
//
//  Created by ZhongyangYu on 14-8-29.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdSpreadScreenManager.h"
#import "AdSpreadScreenManagerDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,AdSpreadScreenManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AdSpreadScreenManager *manager;

@end
