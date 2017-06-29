//
//  JDAdView.h
//  JDAdSDKDemo
//
//  Created by Ben Miao on 15/11/7.
//  Copyright © 2015年 com.jd.dm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDAdConfigration.h"
@class JDAd;
@class JDAdView;
@class JDBannerAdView;
@class JDModalAdView;


@protocol JDAdViewDelegate <NSObject>
//浏览器代理
-(void)adView:(JDAdView*)adView OpenJDAdViewInThirdPartBrowserWithUrl:(NSURL*)url;
//点击代理
- (void)adViewDidClicked:(JDAdView*)adView; //banner，插屏都适用
//banner代理
- (void)bannerDidLoad:(JDBannerAdView*)banner;
- (void)bannerDidLoadSuccess:(JDBannerAdView*)banner;
- (void)bannerWillAppear:(JDBannerAdView *)banner;
- (void)bannerDidAppear:(JDBannerAdView *)banner;
- (void)bannerWillDisappear:(JDBannerAdView *)banner;
- (void)bannerDidDisappear:(JDBannerAdView *)banner;
- (void)bannerView:(JDBannerAdView *)banner didLoadWithError:(NSError *)error;
//插屏代理
- (void)modalViewDidLoadSuccess:(JDModalAdView*)modalView;
- (void)modalView:(JDModalAdView*)modal didLoadWithError:(NSError *)error;

@end

@interface JDAdView : UIView
@property(nonatomic,assign) JDAdType adType; //广告类型
@property(nonatomic,assign) BOOL inSafari; //该adview在safari中打开
@property(nonatomic,assign) BOOL inThirdBrowser; //使用自己的浏览器打开
@property(nonatomic,weak) UIViewController* currentViewController;
@property(nonatomic,weak) UIView *parentView;
@property(nonatomic,assign) id<JDAdViewDelegate> delegate;
@property(nonatomic,strong) JDAd* linkedAd;

- (void)refreshAdView;
@end
