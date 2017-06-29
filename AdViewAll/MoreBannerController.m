//
//  MoreBannerController.m
//  AdViewDevelop
//
//  Created by maming on 16/3/3.
//  Copyright © 2016年 maming. All rights reserved.
//

#import "MoreBannerController.h"
#import "AdViewView.h"

#define View_Width 320
#define SCREEN [UIScreen mainScreen].bounds.size

@interface MoreBannerController()<AdViewDelegate> {
    NSString *currentKey;
    NSMutableArray *keyArr;
    NSMutableDictionary *adViewDict;
}

@end

@implementation MoreBannerController

- (instancetype)init {
    if (self = [super init]) {
        keyArr = [[NSMutableArray alloc] initWithObjects:@"SDK20111022530129m85is43b70r4iyc",@"SDK20150903090237sjtskjva8ppy91r", nil];
        adViewDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Add Banner" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(adAdviewView:) forControlEvents:UIControlEventTouchUpInside];
    button.frame =  CGRectMake((size.width - View_Width)/2, SCREEN.height - 50, View_Width, 50);
    button.backgroundColor = [UIColor lightGrayColor];
    button.tag = 1000;
    button.layer.cornerRadius = 10.0f;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 2.0f;
    [self.view addSubview:button];
    
}

- (void)adAdviewView:(UIButton*)sender {
    
    currentKey = nil;
    for (NSString *key in keyArr) {
        if ([adViewDict objectForKey:key] == nil) {
            currentKey = key;
            break;
        }
    }
    
    if (currentKey == nil) return;

    AdViewView *view = [AdViewView requestAdViewViewWithAppKey:currentKey WithDelegate:self];
    view.tag = 1001 + [adViewDict allKeys].count;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(closeAdview:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Close" forState:UIControlStateNormal];
    button.tag = view.tag + keyArr.count;
    //    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    
    [self.view addSubview:view];
    [adViewDict setObject:view forKey:currentKey];
    //    [adViewArr addObject:view];

    
}

- (void)closeAdview:(UIButton*)sender {
    UIButton *button = (UIButton*)sender;
    NSString *key = [[adViewDict allKeys] objectAtIndex:(button.tag - keyArr.count - 1001)];
    AdViewView *view = [adViewDict objectForKey:key];
    [view removeFromSuperview];
    [button removeFromSuperview];
    [adViewDict removeObjectForKey:key];
    
    for (int i = 0; i < [adViewDict allKeys].count; i++) {
        NSString *key = [[adViewDict allKeys] objectAtIndex:i];
        AdViewView *view = [adViewDict objectForKey:key];
        NSInteger tap  = view.tag;
        view.tag = 1001 + i;
        if (view.tag < tap) {
            UIButton *button = [self.view viewWithTag:tap + keyArr.count];
            button.tag = view.tag + keyArr.count;
        }
    }
    
    [self reSetAdviewSize];
}

- (void)reSetAdviewSize {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat space = 10.0f;
    for (int i = 0; i < [adViewDict allKeys].count; i++) {
        NSString *key = [[adViewDict allKeys] objectAtIndex:i];
        AdViewView *view = (AdViewView*)[adViewDict objectForKey:key];
        CGRect rect = view.frame;
        rect.origin.x = (size.width - rect.size.width) / 2;
        rect.origin.y = (space + 50)*i + 64;
        view.frame = rect;
        
        UIButton *button = [self.view viewWithTag:view.tag+keyArr.count];
        button.frame = CGRectMake(rect.origin.x+rect.size.width - 55, rect.origin.y + (rect.size.height-20)/2, 50, 20);
        [self.view bringSubviewToFront:button];
    }
    
    UIButton *button = (UIButton*)[self.view viewWithTag:1000];
    CGRect buRect = button.frame;
    buRect.origin.y = (space+50)*[adViewDict allKeys].count + 64;
    button.frame = buRect;
}

#pragma mark - adviewviewDelegate

#pragma mark - adviewviewDelegate
//- (NSString *)adViewApplicationKey {
//    return currentKey;
//}

- (NSString *)BaiDuApIDString {
    return @"2f952126";				//@"debug";
}

- (NSString *)BaiDuApSpecString{
    //spec string for baidu
    return @"debug";		//2f952126_e498eab7
}

- (UIViewController *)viewControllerForPresentingModalView {
    //return self;
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

- (void)adViewDidReceiveAd:(AdViewView *)adViewView {
    [self reSetAdviewSize];
}

- (void)adViewDidClickAd:(AdViewView *)adViewView {
}

- (void)adViewStartGetAd:(AdViewView *)adViewView {
}

- (void)adViewDidFailToReceiveAd:(AdViewView *)adViewView usingBackup:(BOOL)yesOrNo {
    
}

- (void)adViewDidReceiveInternet:(AdViewView*)adViewView reachability:(BOOL)bReachable {
}

- (void)adViewReceivedGenericRequest:(AdViewView *)adViewView {
}

- (void)adViewReceivedNotificationAdsAreOff:(AdViewView *)adViewView {
}

- (void)adViewWillPresentFullScreenModal {
}

- (void)adViewDidDismissFullScreenModal {
    
}

- (BOOL)adViewTestMode {
    return NO;
}

- (BOOL)adViewLogMode {
    return YES;
}

- (BOOL)adViewUsingHtml5 {
    return NO;
}

- (BOOL)adGpsMode {
    return NO;
}

- (AdviewBannerSize)PreferBannerSize {
    return AdviewBannerSize_320x50;
}

- (NSString*)adViewDisablePlatformsForIpad {
    return @"";
}

- (AdViewAppAd_BgGradientType)adViewAppAdBackgroundGradientType {
    return AdViewAppAd_BgGradient_Fix;
}

- (AdViewBannerAnimationType)adViewBannerAnimationType {
    return AdViewBannerAnimationTypeRandom;
}


@end
