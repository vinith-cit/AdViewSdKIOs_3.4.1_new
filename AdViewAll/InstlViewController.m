//
//  InstlViewController.m
//  AdViewAll
//
//  Created by ZhongyangYu on 14-9-25.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import "InstlViewController.h"
#import "AdViewExtTool.h"
#import "AdViewConst.h"
#import "AdInstlUtils.h"
#import "MenuView.h"
#import "AdViewLabel.h"

@interface InstlViewController () <MenuViewDelegate>
{
    AdViewLabel * _autoShowInstl;
    AdViewLabel * _singleInstl;
    
    NSMutableArray * _adapterName;
    NSMutableDictionary * _singleAdapterDic;
}
@end

@implementation InstlViewController
@synthesize adInstlManager;

- (void)dealloc
{
//    [_autoShowInstl release]; _autoShowInstl = nil;
//    [_singleInstl release]; _singleInstl = nil;
//    [_adapterName release]; _adapterName = nil;
    
    self.adInstlManager.delegate = nil;
    self.adInstlManager = nil;
//    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.adInstlManager = [AdInstlManager managerWithAdInstlKey:ADINSTLKEY
                                                   WithDelegate:self];
    UITapGestureRecognizer * autoInstlTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAutoInstl)];
    _autoShowInstl = [[AdViewLabel alloc] init];
    [_autoShowInstl setText:@"All Platform Interstitial"];
    [_autoShowInstl addGestureRecognizer:autoInstlTap];
    [_autoShowInstl setColor:BLUE_COLOR];
    [self.view addSubview:_autoShowInstl];
    
    
    UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showSingleInstl)];
    _singleInstl = [[AdViewLabel alloc] init];
    [_singleInstl setText:@"Single Platform Interstitial"];
    [_singleInstl addGestureRecognizer:singleTap];
    [_singleInstl setColor:RED_COLOR];
    [self.view addSubview:_singleInstl];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.frame = CGRectMake(140, 530, 40, 30);
//    [button.layer setCornerRadius:8.0]; //设置矩圆角半径
//    [button.layer setBorderWidth:1.0];   //边框宽度
//    [button.titleLabel setFont:[UIFont fontWithName:@"Times New Roman" size: 8]];
//    [button setTitle:@"展示" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button addTarget:self action:@selector(showintl) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    _adapterName = [[NSMutableArray alloc]init];
    _singleAdapterDic = [[NSMutableDictionary alloc]init];
    
    //获取的是当前SDK中集成的平台数和后台配置的无关
    NSDictionary *platFormDic = [AdInstlUtils getAdPlatforms];
    NSArray *netType = [platFormDic allKeys] ;
    
    NSString *str = nil;
    for (int i = 0; i<[netType count]; i++)
    {
        str = [platFormDic objectForKey:[netType objectAtIndex:i]];
        NSRange range = [str rangeOfString:@","];
        int location = (int)range.location;
        NSString *str1 = [str substringToIndex:location];
        
        [_adapterName addObject:str1];
        [_singleAdapterDic setObject:[netType objectAtIndex:i] forKey:str1];
    }
}


//- (void)showintl
//{
//    [self.adInstlManager showAdInstlView:self];
//}

- (void)viewDidLayoutSubviews
{
    UIDeviceOrientation interfaceOrientation=(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation;
    BOOL bIsLand = UIDeviceOrientationIsLandscape(interfaceOrientation);
    if (bIsLand)
    {
        CGFloat labelHeight = (self.view.frame.size.width / 3 - 3 * SPACE) / 3;
        _autoShowInstl.frame = CGRectMake(self.view.frame.size.width / 4,
                                          self.view.frame.size.height / 2 - SPACE - labelHeight,
                                          self.view.frame.size.width / 2,
                                          labelHeight);
        _singleInstl.frame = CGRectMake(_autoShowInstl.frame.origin.x,
                                        self.view.frame.size.height / 2 + SPACE,
                                        self.view.frame.size.width / 2,
                                        labelHeight);
    }
    else
    {
        CGFloat labelHeight = (self.view.frame.size.height / 3 - 3 * SPACE) / 3;
        _autoShowInstl.frame = CGRectMake(SPACE,
                                          self.view.frame.size.height / 2 - SPACE - labelHeight,
                                          self.view.frame.size.width - 2 * SPACE,
                                          labelHeight);
        _singleInstl.frame = CGRectMake(SPACE,
                                        self.view.frame.size.height / 2 + SPACE,
                                        self.view.frame.size.width - 2 * SPACE,
                                        labelHeight);
    }
}

- (void)showAutoInstl
{
    [self.adInstlManager loadAdInstlView:self];
}

- (void)showSingleInstl
{
    MenuView * menu = [[MenuView alloc] initWithMenuFrame:CGRectMake(0, 0, self.view.frame.size.width / 6 * 5, self.view.frame.size.height / 3 * 2)
                                                itemArray:_adapterName
                                                 delegate:self];
    menu.layer.cornerRadius = 10.0;
    [self.view addSubview:menu];
}

#pragma mark - instl deleage

- (void)adInstlManager:(AdInstlManager*)manager didGetEvent:(InstlEventType)eType error:(NSError*)error
{
    switch (eType) {
//            加载广告成功后
        case InstlEventType_DidLoadAd:
            //调用展示广告的方法
            
            [self.adInstlManager showAdInstlView:self];
            break;
        case InstlEventType_FailLoadAd:
            break;
        case InstlEventType_DidDismissAd:
            NSLog(@"插屏关闭");
            break;
        default:
            break;
    }
}

- (void)adInstlReceivedNotificationAdsAreOff:(AdInstlManager*)manager
{
    
}

- (BOOL)adInstlUsingSKStoreProductViewController{
    return YES;
}

- (BOOL)adInstlTestMode {
    return NO;
}

- (BOOL)adInstlLogMode {
    return YES;
}

/**
 * 是否使用html5广告，缺省为NO
 */
//- (BOOL)adInstlUsingHtml5
//{
//    return NO;
//}

#pragma mark - menuView deleage
- (void)tapMissionButton:(NSInteger)number
{
    int index = [[_singleAdapterDic objectForKey:[_adapterName objectAtIndex:number]] intValue];
    [self.adInstlManager loadSingleAdInstlView:self withIndex:index];
}

- (void)tapDissmissMenuView
{

}

@end
