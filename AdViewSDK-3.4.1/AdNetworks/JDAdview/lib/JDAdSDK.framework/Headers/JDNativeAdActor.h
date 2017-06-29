//
//  JDNativeAdActor.h
//  JDAdSDKDemo
//
//  Created by Ben Miao on 15/11/12.
//  Copyright © 2015年 com.jd.dm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDNativeAdActor : NSObject

- (NSString*)getImgUrlString; //获取图片url

- (NSString*)getNativeAdTitle;

- (NSString*)getClickUrl;  //点击url

- (void)doExposedReports;  //曝光行为

- (NSString*)getProductDesc;

@end
