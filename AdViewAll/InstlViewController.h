//
//  InstlViewController.h
//  AdViewAll
//
//  Created by ZhongyangYu on 14-9-25.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdInstlManager.h"
#import "AdInstlManagerDelegate.h"

@interface InstlViewController : UIViewController <AdInstlManagerDelegate>

@property (nonatomic, strong) AdInstlManager * adInstlManager;

@end
