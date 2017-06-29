//
//  BannerViewController.m
//  AdViewAll
//
//  Created by ZhongyangYu on 14-9-25.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import "BannerViewController.h"
#import "AdViewUtils.h"
#import "AdViewController.h"
#import "AdViewLabel.h"
#import "AdViewExtTool.h"
#import "AdSingleTestViewController.h"
#import "MenuView.h"
#import "SimpleToolViewController.h"
#import "ShowBannerViewController.h"
#import "MoreBannerController.h"

@interface BannerViewController () <AdViewControllerDelegate,MenuViewDelegate>
{
    AdViewLabel * _autoBanner;  //显示横幅广告
    AdViewLabel * _singleBanner;//单平台演示
    AdViewLabel * _autoTest;    //自动测试
    AdViewLabel * _changeLocation;  //横幅位置转换
    AdViewLabel * _moreBanner;
    
    NSMutableArray * _adapterName;
    NSMutableDictionary * _singleAdapterDic;
}

@end

@implementation BannerViewController
@synthesize adProviders;

- (void)dealloc
{
    [AdViewController deleteController];
    self.adProviders = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _autoBanner = [[AdViewLabel alloc] init];
    [_autoBanner setText:@"All Platform Banner"];
    [_autoBanner setColor:BLUE_COLOR];
    [self.view addSubview:_autoBanner];
    UITapGestureRecognizer * autoBannerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAutoBanner)];
    [_autoBanner addGestureRecognizer:autoBannerTap];
    
    _autoTest = [[AdViewLabel alloc] init];
    [_autoTest setText:@"Auto Test"];
    [_autoTest setColor:RED_COLOR];
    [self.view addSubview:_autoTest];
    UITapGestureRecognizer * autoTestTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(autoTestTap)];
    [_autoTest addGestureRecognizer:autoTestTap];
    
    _singleBanner = [[AdViewLabel alloc] init];
    [_singleBanner setText:@"Single Platform Banner"];
    [_singleBanner setColor:GREEN_COLOR];
    [self.view addSubview:_singleBanner];
    UITapGestureRecognizer * singleBannerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleBannerTap)];
    [_singleBanner addGestureRecognizer:singleBannerTap];
    
    _moreBanner = [[AdViewLabel alloc] init];
    [_moreBanner setText:@"Several Banners"];
    [_moreBanner setColor:YELLOW_COLOR];
    [self.view addSubview:_moreBanner];
    UITapGestureRecognizer * moreBannerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreBannerTap)];
    [_moreBanner addGestureRecognizer:moreBannerTap];
}


- (void)moreBannerTap{
    MoreBannerController *mbvc = [[MoreBannerController alloc] init];
   [self.navigationController pushViewController:mbvc animated:YES];
    
}

- (void)showAutoBanner
{
    ShowBannerViewController * sbvc = [[ShowBannerViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:sbvc animated:YES];
}



- (void)autoTestTap
{
    [AdViewController deleteController];
    
    AdSingleTestViewController *testController = [[AdSingleTestViewController alloc] initWithNibName:nil bundle:nil];
    testController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:testController animated:YES];
}


- (void)singleBannerTap
{
    _adapterName = [[NSMutableArray alloc]init];
    _singleAdapterDic = [[NSMutableDictionary alloc]init];
    
    self.adProviders = [AdViewUtils getAdPlatforms];
    NSArray * netType = [self.adProviders allKeys] ;
    
    NSString *str = nil;
    for (int i = 0; i< [netType count]; i++)
    {
        str = [self.adProviders objectForKey:[netType objectAtIndex:i]];
        NSRange range = [str rangeOfString:@","];
        long location = range.location;
        NSString *str1 = [str substringToIndex:location];
        
        [_adapterName addObject:str1];
        [_singleAdapterDic setObject:[netType objectAtIndex:i] forKey:str1];
    }
    MenuView * menu = [[MenuView alloc] initWithMenuFrame:CGRectMake(0, 0, self.view.frame.size.width / 6 * 5, self.view.frame.size.height / 3 * 2)
                                                itemArray:_adapterName
                                                 delegate:self];
    menu.layer.cornerRadius = 10.0;
    [self.view addSubview:menu];
}


- (void)changeLocationTap
{
    AdViewController *controller = [AdViewController sharedControllerIfExists];

    if (controller.getAdPosition.y == AD_POS_REWIND)
    {
        [controller setAdPosition:CGPointMake(AD_POS_CENTER, 0)]; //上
    }
    else
    {
        [controller setAdPosition:CGPointMake(AD_POS_CENTER, AD_POS_REWIND)]; //下
    }
}

- (void)viewDidLayoutSubviews
{
    CGFloat BgY = self.view.frame.size.height /2;
    
    CGFloat ButtonHeight = ((self.view.frame.size.height - BgY ) - 4 * SPACE *2) / 4;
    
    _autoBanner.frame = CGRectMake(SPACE,
                                   BgY,
                                   self.view.frame.size.width - SPACE * 2,
                                   ButtonHeight);
    BgY += ButtonHeight + SPACE;
    
    _singleBanner.frame = CGRectMake(SPACE,
                                     BgY,
                                     self.view.frame.size.width - SPACE * 2,
                                     ButtonHeight);
    
    BgY += ButtonHeight + SPACE;
    _autoTest.frame = CGRectMake(SPACE,
                                 BgY,
                                 self.view.frame.size.width - SPACE * 2,
                                 ButtonHeight);
    
    BgY += ButtonHeight + SPACE;
    _moreBanner.frame = CGRectMake(SPACE,
                                 BgY,
                                 self.view.frame.size.width - SPACE * 2,
                                 ButtonHeight);
    
    //    BgY += ButtonHeight + SPACE;
    //
    //    _changeLocation.frame = CGRectMake(SPACE,
    //                                       BgY,
    //                                       self.view.frame.size.width - SPACE * 2,
    //                                       ButtonHeight);
}

#pragma mark - AdViewControllerDelegate
- (void)didGotNotify:(NSString*)code Info:(NSString*)content
{
    
}

#pragma mark - menuView deleage
- (void)tapMissionButton:(NSInteger)number
{
    NSInteger row = number;
    NSInteger count = [[self.adProviders allKeys] count];
    if (row < count)
    {
        NSNumber *keyNum = [[self.adProviders allKeys] objectAtIndex:row];
        [self setAllAdProviders:NO Except:[keyNum intValue]];
    }
    else
    {
//        [self startAutoTestAdProvider];
        return;
    }
    SimpleToolViewController *simple = [[SimpleToolViewController alloc] init];
    [self.navigationController pushViewController:simple animated:YES];
}

- (void)tapDissmissMenuView {
    self.adProviders = nil;
}

- (void)setAllAdProviders:(BOOL)bVal Except:(int)type
{
    NSArray *keyArr = [self.adProviders allKeys];
    
    int     setVal = bVal?1:0;
    int     extVal = bVal?0:1;
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:10];
    for (int i = 0; i < [keyArr count]; i++)
    {
        NSNumber *keyNum = [keyArr objectAtIndex:i];
        
        if (nil == keyNum) continue;
        
        int iVal = setVal;
        if (type == [keyNum intValue]) iVal = extVal;
        [dict setObject:[NSNumber numberWithInt:iVal] forKey:keyNum];
    }
    [AdViewUtils setAdPlatformStatus:dict];
}

@end
