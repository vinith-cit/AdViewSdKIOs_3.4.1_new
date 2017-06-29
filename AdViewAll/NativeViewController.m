//
//  NativeViewController.m
//  AdViewAll
//
//  Created by 周桐 on 16/1/15.
//  Copyright © 2016年 unakayou. All rights reserved.
//

#import "NativeViewController.h"
#import "AdViewExtTool.h"
#import "AdViewConst.h"
#import "AdNativeUtils.h"
#import "MenuView.h"
#import "AdViewLabel.h"
#import "MenuView.h"
#import "ShowNativeViewController.h"

@interface NativeViewController ()<MenuViewDelegate>
{
    AdViewLabel * _autoNativeView;  //显示广告
    AdViewLabel * _singleNativeView;//单平台演示
    
    NSMutableArray * _adapterName;
    NSMutableDictionary * _singleAdapterDic;
}
@end

@implementation NativeViewController

- (void)dealloc
{
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _autoNativeView = [[AdViewLabel alloc] init];
    [_autoNativeView setText:@"All Platform Native"];
    [_autoNativeView setColor:BLUE_COLOR];
    [self.view addSubview:_autoNativeView];
    UITapGestureRecognizer * autoNativeView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAutoNativeView)];
    [_autoNativeView addGestureRecognizer:autoNativeView];
    
    
    _singleNativeView = [[AdViewLabel alloc] init];
    [_singleNativeView setText:@"Single Platform Native"];
    [_singleNativeView setColor:RED_COLOR];
    [self.view addSubview:_singleNativeView];
    UITapGestureRecognizer * singleNativeView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleNativeView)];
    [_singleNativeView addGestureRecognizer:singleNativeView];
}

- (void)singleNativeView
{
    _adapterName = [[NSMutableArray alloc]init];
    _singleAdapterDic = [[NSMutableDictionary alloc]init];
    
    NSDictionary *adProviders = [AdNativeUtils getAdPlatforms];
    NSArray * netType = [adProviders allKeys] ;
    
    NSString *str = nil;
    for (int i = 0; i< [netType count]; i++)
    {
        str = [adProviders objectForKey:[netType objectAtIndex:i]];
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


- (void)viewDidLayoutSubviews
{
    CGFloat BgY = self.view.frame.size.height / 2;
    
    CGFloat ButtonHeight = ((self.view.frame.size.height - BgY ) - 4 * SPACE ) / 4;
    
    _autoNativeView.frame = CGRectMake(SPACE,
                                   BgY,
                                   self.view.frame.size.width - SPACE * 2,
                                   ButtonHeight);
    BgY += ButtonHeight + SPACE;
    
    _singleNativeView.frame = CGRectMake(SPACE,
                                     BgY,
                                     self.view.frame.size.width - SPACE * 2,
                                     ButtonHeight);
    
    BgY += ButtonHeight + SPACE;
}

- (void)showAutoNativeView
{
    ShowNativeViewController *vc = [[ShowNativeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - menuView deleage
- (void)tapMissionButton:(NSInteger)number
{
    int index = [[_singleAdapterDic objectForKey:[_adapterName objectAtIndex:number]] intValue];
    ShowNativeViewController *vc = [[ShowNativeViewController alloc] init];
    vc.adIndex = index;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapDissmissMenuView {
    
}


@end
