//
//  ViewController.m
//  AdViewAll
//
//  Created by ZhongyangYu on 14-8-29.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//


#import "ViewController.h"
#import "AdViewExtTool.h"
#import "AdViewLabel.h"
#import "AdInstlUtils.h"
#import "BannerViewController.h"
#import "InstlViewController.h"
#import "NativeViewController.h"
#import "VideoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage * logoImage = [UIImage imageNamed:@"logo.jpg"];
    CGFloat imageWidth = logoImage.size.width;
    CGFloat imageHeight = logoImage.size.height;
    CGFloat logoHeight = self.view.frame.size.width * imageHeight / imageWidth;
    
    UIImageView * adView_logo = [[UIImageView alloc] initWithImage:logoImage];
    adView_logo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:adView_logo];
    
    if (iOS7 || iOS8)
        [adView_logo setFrame:CGRectMake(self.view.frame.size.width/10, (self.view.frame.size.height/4-logoHeight*2/5), self.view.frame.size.width*4/5, logoHeight*4/5)];
    else
        [adView_logo setFrame:CGRectMake(self.view.frame.size.width/10, (self.view.frame.size.height/4-logoHeight*2/5), self.view.frame.size.width*4/5, logoHeight*4/5)];
    
    UILabel * versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                       adView_logo.frame.size.height + adView_logo.frame.origin.y,
                                                                       self.view.frame.size.width, 20)];
    versionLabel.text = @"------V3.4.1------";
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:versionLabel];
    
    
    
    UITapGestureRecognizer * bannerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bannerViewController)];
    UITapGestureRecognizer * instlTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(instlViewController)];
    UITapGestureRecognizer * nativeTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nativeViewController)];
    UITapGestureRecognizer * videoTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(videoViewController)];
    UITapGestureRecognizer * upLogTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeLog)]; 
    
    NSArray * buttonTitleArray =  @[@"Banner ads",@"Full / screen ads",@"Native ads",@"Video ad",@"Update log"];
    NSArray * buttonColorArray = @[RED_COLOR,BLUE_COLOR,GREEN_COLOR,YELLOW_COLOR,RED_COLOR];
    NSArray * gestureArray = [NSArray arrayWithObjects:bannerTap,instlTap,nativeTap,videoTap,upLogTap, nil];
    
    CGFloat buttonHeight = (self.view.frame.size.height / 2 -  SPACE * 8) / 5;
    for (int i = 0; i < 5; i++)
    {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(SPACE,
                                                                    self.view.frame.size.height / 2 + i * (buttonHeight + SPACE ),
                                                                    self.view.frame.size.width - SPACE * 2,
                                                                    buttonHeight)];
        
        label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        [label setUserInteractionEnabled:YES];
        [label setText:[buttonTitleArray objectAtIndex:i]];
        [label setTextColor:[UIColor whiteColor]];
        [label addGestureRecognizer:[gestureArray objectAtIndex:i]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[AdViewExtTool hexStringToColor:[buttonColorArray objectAtIndex:i]]];
        [self.view addSubview:label];
    }
}

- (void)bannerViewController
{
    BannerViewController * bvc = [[BannerViewController alloc] init];
    [self.navigationController pushViewController:bvc animated:YES];
}

- (void)instlViewController
{
    InstlViewController * ivc = [[InstlViewController alloc] init];
    [self.navigationController pushViewController:ivc animated:YES];
}

- (void)nativeViewController{
    NativeViewController *nvc = [[NativeViewController alloc] init];
    [self.navigationController pushViewController:nvc animated:YES];
}
- (void)videoViewController{
    VideoViewController *vvc = [[VideoViewController alloc] init];
    [self.navigationController pushViewController:vvc animated:YES];
}

- (void)changeLog
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"版本更新信息"
                                                     message:@"\n1.添加舜飞平台2.0.4版本。\n2.添加Unity平台2.0版本。\n3.添加欧朋平台1.0版本。\n4.添加Millennial Media平台6.3.1版本。\n5.添加AdColony平台3.0.6版本。\n6.更新广点通平台4.5.4版本。\n7.更新Vpon平台至4.6.3版本。\n8.更新Chance平台至6.4.3版本。\n9.更新AdMob平台7.16.0版本。"
                                                    delegate:self
                                           cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}
@end
