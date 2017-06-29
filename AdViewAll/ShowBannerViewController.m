//
//  ShowBannerViewController.m
//  AdViewAll
//
//  Created by unakayou on 14/10/30.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import "ShowBannerViewController.h"
#import "AdViewExtTool.h"
#import "AdViewConst.h"

static BOOL simpleTool_Test = NO;
static BOOL simpleTool_Log = YES;

static int gSimpAdSize = AdviewBannerSize_Auto;
@interface ShowBannerViewController ()

@end

@implementation ShowBannerViewController
@synthesize requestAd;
@synthesize changeLocation;
@synthesize otherAds;
@synthesize sizeButton;
@synthesize infoLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.requestAd setBackgroundColor:[AdViewExtTool hexStringToColor:BLUE_COLOR]];
    [self.otherAds setBackgroundColor:[AdViewExtTool hexStringToColor:RED_COLOR]];
    [self.changeLocation setBackgroundColor:[AdViewExtTool hexStringToColor:YELLOW_COLOR]];
    
    self.infoLabel.text = @"Request New Ad pressed! Requesting...";
    
    AdViewController * controller = [AdViewController sharedController];
    [controller setAdViewKey:ADBANNERKEY];//SDK20111022530129m85is43b70r4iyc
    [controller setOrientationUp:NO Down:NO Left:NO Right:YES];
    [controller setAdBannerSize:AdviewBannerSize_Auto];
    [controller setAdRootController:self];
    [controller setNotifyDelegate:self];
    [controller setModeTest:YES Log:YES];
    [controller loadView];
    [self.view addSubview:controller.adView];
}

- (void)dealloc {
    self.requestAd = nil;
    self.otherAds = nil;
    self.changeLocation = nil;
    self.sizeButton = nil;
    self.infoLabel = nil;
    [AdViewController deleteController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestNewAd:(id)sender
{
    [self requestOtherAd:nil];
}

- (IBAction)requestOtherAd:(id)sender
{
    self.infoLabel.text = @"Request New Ad pressed! Requesting...";
    AdViewController *controller = [AdViewController sharedControllerIfExists];
    [controller requestNewAd];
}

-(IBAction)changeLocation:(id)sender
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

- (IBAction)changeAdSize:(id)sender {
    int toAdSize = gSimpAdSize+1;
    if (toAdSize > AdviewBannerSize_728x90)
        toAdSize = AdviewBannerSize_Auto;
    
    gSimpAdSize = toAdSize;
    
    AdViewController *controller = [AdViewController sharedControllerIfExists];
    [controller setAdBannerSize:gSimpAdSize];
    [self showAdSizeLabel];
}

- (void)showAdSizeLabel {
    UIButton *buttonAdSize = self.sizeButton;
    
    NSString *lableStr = @"auto --> next";
    switch (gSimpAdSize) {
        case AdviewBannerSize_320x50:lableStr = @"320x50 -->next"; break;
        case AdviewBannerSize_300x250:lableStr = @"300x250 -->next"; break;
        case AdviewBannerSize_480x60:lableStr = @"480x60 -->next"; break;
        case AdviewBannerSize_728x90:lableStr = @"728x90 -->next"; break;
        default:
            break;
    }
    
    [buttonAdSize setTitle:lableStr forState:UIControlStateNormal];
}

- (IBAction)testSwitch:(id)sender {
    if ([sender isKindOfClass:[UISwitch class]]) {
        simpleTool_Test = ((UISwitch*)sender).on;
        
        AdViewController *controller = [AdViewController sharedControllerIfExists];
        [controller setModeTest:simpleTool_Test Log:simpleTool_Log];
    }
}

- (void)didGotNotify:(NSString*)code Info:(NSString*)content
{
    self.infoLabel.text = [NSString stringWithFormat:@"code:%@, info:%@", code, content];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [AdViewController deleteController];
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
