//
//  JDAd.h
//  JDAdSDKDemo
//
//  Created by Ben Miao on 15/11/7.
//  Copyright © 2015年 com.jd.dm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDAdConfigration.h"
@class JDAd;
@class JDAdView;
@class JDAdUser;
@class JDAdAppInfo;
@class JDAdDeviceInfo;
@class JDNativeAd;
@protocol JDAdDelegate <NSObject>
/**
 *  获取Native Ads
 *
 *  @param nativeAd
 */
- (void)nativeAd:(JDNativeAd*)nativeAd;
- (void)ad:(JDAd*)ad networkErrorState:(JDAdURLResponseStatus)state;
//暂不支持
- (void)ad:(JDAd*)ad networkErrorState:(JDAdURLResponseStatus)state andError:(NSError*)error;

@end

@interface JDAd : NSObject

@property(nonatomic,assign) BOOL istest;
@property(nonatomic,assign) JDAdType adType;
@property(nonatomic,weak) JDAdView *adView;
@property(nonatomic,strong) JDAdUser *user;
@property(nonatomic,strong) JDAdDeviceInfo *device;
@property(nonatomic,strong) JDAdAppInfo *app;
@property(nonatomic,strong) NSString* tagId;
@property(nonatomic,strong) id<JDAdDelegate> delegate;


- (void)loadAdView;

@end
