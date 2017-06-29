//
//  AdViewExtTool.h
//  AdViewAll
//
//  Created by ZhongyangYu on 14-9-25.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdViewConst.h"

@interface AdViewExtTool : NSObject

+ (UIImage *) createImageWithColor:(UIColor *)color;

+ (UIColor*) hexStringToColor: (NSString *) stringToConvert;

@end
