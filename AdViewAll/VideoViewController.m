//
//  VideoViewController.m
//  AdViewAll
//
//  Created by zhoutong on 16/10/20.
//  Copyright © 2016年 unakayou. All rights reserved.
//

#import "VideoViewController.h"
#import "AdViewLabel.h"
#import "AdVideoManager.h"
#import "AdVideoManagerDelegate.h"
#import "AdViewExtTool.h"
#import "AdViewConst.h"

#define SCREENSIZE ([UIScreen mainScreen].bounds.size)

@interface VideoViewController ()<AdVideoManagerDelegate>


@property (nonatomic,strong) AdViewLabel * autoVideoView;  //显示广告
@property (nonatomic,strong) AdVideoManager *videoManger;

@end

@implementation VideoViewController

- (void)dealloc
{
    self.videoManger.delegate = nil;
    self.videoManger = nil;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.videoManger = [AdVideoManager managerWithAdVideoKey:ADVIDEOKEY WithDelegate:self];
    
    UITapGestureRecognizer * autoInstlTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideo)];
    self.autoVideoView = [[AdViewLabel alloc] init];
    [self.autoVideoView setText:@"Show Video"];
    [self.autoVideoView addGestureRecognizer:autoInstlTap];
    [self.autoVideoView setColor:RED_COLOR];
    [self.view addSubview:self.autoVideoView];
}

- (void)showVideo
{
    [self.videoManger loadVideoAd:self];
}
- (void)viewDidLayoutSubviews
{
    UIDeviceOrientation interfaceOrientation=(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation;
    BOOL bIsLand = UIDeviceOrientationIsLandscape(interfaceOrientation);
    if (bIsLand)
    {
        CGFloat labelHeight = (self.view.frame.size.width / 3 - 3 * SPACE) / 3;
        self.autoVideoView.frame = CGRectMake(self.view.frame.size.width / 4,
                                          self.view.frame.size.height / 2 - SPACE - labelHeight,
                                          self.view.frame.size.width / 2,
                                          labelHeight);
    }
    else
    {
        CGFloat labelHeight = (self.view.frame.size.height / 3 - 3 * SPACE) / 3;
        self.autoVideoView.frame = CGRectMake(SPACE,
                                          self.view.frame.size.height / 2 - SPACE - labelHeight,
                                          self.view.frame.size.width - 2 * SPACE,
                                          labelHeight);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 信息回调
 */
- (void)adVideoManager:(AdVideoManager*)manager didGetEvent:(VideoEventType)eType error:(NSError*)error{
    if (eType == VideoEventType_DidLoadAd) {
        [manager showVideoAdWithController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
}

/**
 *
 */
- (void)adVideoManager:(AdVideoManager*)manager videoAvailable:(BOOL)avilable{}

/**
 * 是否打开测试模式，缺省为NO
 */
- (BOOL)adVideoTestMode{
    return NO;
}

/**
 * 是否打开日志模式，缺省为NO
 */
- (BOOL)adVideoLogMode{
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
