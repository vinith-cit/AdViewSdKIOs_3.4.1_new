//
//  ShowNativeViewController.m
//  AdViewAll
//
//  Created by 周桐 on 16/1/17.
//  Copyright © 2016年 unakayou. All rights reserved.
//


#import "ShowNativeViewController.h"
#import "AdNativeManager.h"
#import "AdNativeManagerDelegate.h"
#import "AdViewConst.h"

#define SCREENSIZE ([UIScreen mainScreen].bounds.size)

@interface ShowNativeViewController ()<AdNativeManagerDelegate>
@property (nonatomic,strong) AdNativeManager *nativeManager;

@property (nonatomic,strong) NSArray *adArr;
@property (nonatomic,strong) UILabel *label;
//原生广告数据序号
@property (nonatomic,assign) int adCountIndex;

@end

@implementation ShowNativeViewController
@synthesize nativeManager;
@synthesize adArr;
@synthesize adIndex;
@synthesize adCountIndex;
@synthesize label;

- (void)dealloc
{
    self.nativeManager.delegate = nil;
    self.nativeManager = nil;
    self.adArr = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.nativeManager= [AdNativeManager managerWithAdNativeKey:ADNATIVEKEY WithDelegate:self];
    [self.previousAdBtn setEnabled:NO];
    [self.nextAdBtn setEnabled:NO];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREENSIZE.height - 60, SCREENSIZE.width, 60)];
    self.label.text = @"";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)requestAd:(id)sender {
    if (self.adIndex) {
        [nativeManager loadSingleAdNative:3 withIndex:self.adIndex];
    }else{
        [nativeManager loadNativeAd:3];
    }
}

- (IBAction)closeAd:(id)sender {
    for (UIView *view in self.view.subviews) {
        if (view.tag == 1000) {
            [view removeFromSuperview];
        }
    }
    [self.previousAdBtn setEnabled:NO];
    [self.nextAdBtn setEnabled:NO];
}

- (IBAction)previousAd:(id)sender {
    
    self.adCountIndex--;
    [self createNativeAdView];
}

- (IBAction)nextAd:(id)sender {
    
    self.adCountIndex++;
    [self createNativeAdView];
}

- (CGSize)changeSize:(CGSize)size from:(CGSize)standardSize {
    CGSize rectSize;
//    standardSize = CGSizeMake(standardSize.width*0.8, standardSize.width*0.8);
    
    CGFloat scaleX = size.width/standardSize.width;
    CGFloat scaleY = size.height/standardSize.height;
    CGFloat scale = (scaleX > scaleY) ? scaleX : scaleY;
    rectSize = CGSizeMake(size.width / scale, size.height / scale);
    
    return rectSize;
}

- (void)createNativeAdView{
    
    NSLog(@"conut :%lu , index %d",(unsigned long)self.adArr.count,self.adCountIndex);
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
    
        for (UIView *view in self.view.subviews) {
            if (view.tag == 1000) {
                [view removeFromSuperview];
            }
        }
        
        if (self.adCountIndex - 1  >= 0) {
            [self.previousAdBtn setEnabled:YES];
        }else{
            [self.previousAdBtn setEnabled:NO];
        }
        if (self.adCountIndex + 1 < (int)self.adArr.count) {
            [self.nextAdBtn setEnabled:YES];
        }else{
            [self.nextAdBtn setEnabled:NO];
        }

        if (!self.adArr || self.adArr.count < 1) {
            return ;
        }
        
        AdViewNativeAdInfo *info = [self.adArr objectAtIndex:self.adCountIndex];
        
//      图标
        UIImage *iconImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[info.nativeAdDict objectForKey:AdViewNativeAdIconUrl]]]];
        UIImageView *iconImgView = [[UIImageView alloc] initWithImage:iconImage];
        BOOL isOverLength = NO;
        if (iconImage) {
            if (iconImage.size.width / iconImage.size.height > 3) {
                isOverLength = YES;
                CGSize size = [self changeSize:iconImage.size from:SCREENSIZE];
                iconImgView.frame = CGRectMake(0, 0, size.width, size.height);
            }else
                iconImgView.frame = CGRectMake(0, 0, 60 * iconImage.size.width / iconImage.size.height, 60);
        }
        
        CGFloat showSizeW = isOverLength ? iconImgView.frame.size.width:SCREENSIZE.width;
        
//      图片
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[info.nativeAdDict objectForKey:AdViewNativeAdImageUrl]]]];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
        if (image) {
            imgView.frame = CGRectMake(0, iconImgView.frame.size.height, showSizeW, showSizeW* image.size.height/image.size.width);
        }

        CGFloat showSizeH = iconImgView.frame.size.height + imgView.frame.size.height;
       
        UIView *showView = [[UIView alloc] initWithFrame:CGRectMake((SCREENSIZE.width-showSizeW)/2, 64, showSizeW, showSizeH)];
        showView.backgroundColor = [UIColor clearColor];
        showView.tag = 1000;
        
        if (!isOverLength) {
            CGFloat space = 10;
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(space + iconImgView.frame.size.width, 0, SCREENSIZE.width - space - iconImgView.frame.size.width, 30)];
            title.text = [info.nativeAdDict objectForKey:AdViewNativeAdTitle];
            
            UILabel *des = [[UILabel alloc] initWithFrame:CGRectMake(space + iconImgView.frame.size.width, title.frame.size.height, SCREENSIZE.width - space - iconImgView.frame.size.width, 30)];
            des.text = [info.nativeAdDict objectForKey:AdViewNativeAdDesc];
            des.numberOfLines = 0;
            [showView addSubview:title];
            [showView addSubview:des];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        [showView addGestureRecognizer:tap];
        [showView addSubview:iconImgView];
        [showView addSubview:imgView];
        [self.view addSubview:showView];
        
        [info showNativeAdWith:showView];
    });

}

- (void)click{
    [[self.adArr objectAtIndex:self.adCountIndex] clickNativeAd];
}
#pragma mark AdNativeManagerDelegate

/**
 * 用来弹出目标页的ViewController，一般为当前ViewController
 */
- (UIViewController*)viewControllerForPresentingModalView{
    return self;
}

/**
 * 信息回调
 */
- (void)requestNativeAdSuccessed:(AdNativeManager*)manager adInfo:(NSArray*)adviewNativeAdArray{
    self.adArr = adviewNativeAdArray;
    self.adCountIndex = 0;
    self.label.text = @"请求广告成功";
    [self createNativeAdView];
}

- (void)requestNativeAdFailed:(AdNativeManager*)manager error:(NSError*)error{
    NSLog(@"%s with %@",__func__,error.domain);
    self.label.text = error.domain;
}

/**
 * 取得配置的回调通知
 */
- (void)adNativeDidReceiveConfig:(AdNativeManager*)manager{
    NSLog(@"%s",__func__);
    self.label.text = @"获取配置成功";
}

/**
 * 配置全部无效或为空的通知
 */
- (void)adNativeReceivedNotificationAdsAreOff:(AdNativeManager*)manager{
    NSLog(@"%s",__func__);
    self.label.text = @"无配置";
}

/**
 * 是否打开测试模式，缺省为NO
 */
- (BOOL)adNativeTestMode{
    return NO;
}

- (BOOL)adNativeLogMode {
    return YES;
}

@end
