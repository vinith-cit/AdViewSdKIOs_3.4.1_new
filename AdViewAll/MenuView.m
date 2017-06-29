//
//  MenuView.m
//  AdWallMenu
//
//  Created by unakayou on 13-7-26.
//  Copyright (c) 2013年 于. All rights reserved.
//
//#define SPACE 50
#define HIGH_EACH_ROW 50

#import "MenuView.h"
#import <QuartzCore/QuartzCore.h>
#import "AdInstlUtils.h"
#import "AdInstlManager.h"
#import "AdViewExtTool.h"

#pragma mark MenuView
@interface MenuView ()
{
    id <MenuViewDelegate> _menuViewDelegate;
    CGRect     _originalFrame; //原始的frame
    UIButton * _cancelButton;
    MenuScrollView * _menuScrollView;
}
@end

@implementation MenuView

- (id)initWithMenuFrame:(CGRect)frame itemArray:(NSArray *)items delegate:(id<MenuViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self)
    {
        /*判断是否超出边界,超出边界，直接返回空白页面*/
        if (self.frame.origin.x < 0 ||
            self.frame.origin.y < 0 ||
            self.frame.origin.x + self.frame.size.width  > [UIScreen mainScreen].bounds.size.width ||
            self.frame.origin.y + self.frame.size.height > [UIScreen mainScreen].bounds.size.height )
            return self;
        
        self.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height / 2);
        UIImage * backgroundImage = [AdViewExtTool createImageWithColor:[AdViewExtTool hexStringToColor:MUILK_COLOR]];
        self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        
        _originalFrame  = frame;//用于旋转适配
        _menuViewDelegate = delegate;
        
        [self creatMenuScorllViewWithItems:items frame:frame];
        [self creatCancelButton];

        return self;
    }
    return nil;
}

#pragma mark MenuView-CreatSomething
- (void)creatMenuScorllViewWithItems:(NSArray *)items frame:(CGRect)frame
{
    _menuScrollView = [[MenuScrollView alloc] initWithItems:items
                                                      frame:CGRectMake(0,
                                                                       frame.size.height / 5,
                                                                       frame.size.width,
                                                                       frame.size.height / 5 * 4)
                                                   delegate:_menuViewDelegate];
    
    [self addSubview:_menuScrollView];
}

- (void)creatCancelButton
{
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *cancelButtonImage = [UIImage imageNamed:@"AdInStLClOsE.png"];
    [_cancelButton setBackgroundImage:cancelButtonImage forState:UIControlStateNormal];
    [_cancelButton setBounds:CGRectMake(0, 0, 40, 40)];
    [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cancelButton];
}


#pragma mark -
#pragma mark buttonThings

- (void)cancelButtonClick
{
    
    [self removeFromSuperview];
}

- (void)layoutSubviews
{
    UIInterfaceOrientation interfaceOrientation=[[UIApplication sharedApplication] statusBarOrientation];
    BOOL bIsLand = UIDeviceOrientationIsLandscape(interfaceOrientation);
    if (bIsLand)
    {
        [self refreshVerticalLayout];
    }
    else
    {
        [self refreshHorizontalLayout];
    }
}

//竖屏UIView界面位置
- (void)refreshHorizontalLayout
{
//    NSLog(@"%f,%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    
    self.center   = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height / 2);
    
    self.bounds   = CGRectMake(0, 0, _originalFrame.size.width, _originalFrame.size.height);
    
    _cancelButton.center = CGPointMake(self.bounds.size.width - 10, 10);
    
    _menuScrollView.frame = CGRectMake(0,
                                       50,
                                       self.bounds.size.width,
                                       _originalFrame.size.height - 100);
}
//横屏UIView界面位置
- (void)refreshVerticalLayout
{
//    NSLog(@"fffffffff %f,%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
//
//    NSLog(@"%f,%f",_originalFrame.size.width,_originalFrame.size.height);
//    if (iOS8)
//    {
//        if (_originalFrame.size.height > [UIScreen mainScreen].bounds.size.height / 4 * 3)
//        {
//            self.bounds = CGRectMake(0, 0, _originalFrame.size.width, [UIScreen mainScreen].bounds.size.height / 4 * 3);
//        }
//        else
//        {
//            self.bounds = CGRectMake(0, 0, _originalFrame.size.width,_originalFrame.size.height);
//        }
//        
//        self.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2, [[UIScreen mainScreen] bounds].size.height / 2 + STATUA_BAR_HEIGHT);
//
//        _cancelButton.center = CGPointMake(self.bounds.size.width - 10, 10);
//    }
//    else
    {
        self.bounds = CGRectMake(0, 0, _originalFrame.size.height,_originalFrame.size.width);
    
        self.center = CGPointMake([[UIScreen mainScreen] bounds].size.height / 2, [[UIScreen mainScreen] bounds].size.width / 2);
        
        _cancelButton.center = CGPointMake(self.bounds.size.width - 10, 10);
    }
}

#pragma mark -

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    _menuViewDelegate = nil;
    _menuScrollView = nil;
}

@end

#pragma mark -
#pragma mark MenuScrollView
@interface MenuScrollView ()
{
    id <MenuViewDelegate> _menuScrollViewDelegate;
    CGRect    originalFrame;
    NSInteger _buttonCounts;
    
}
@property (nonatomic, retain) AdInstlManager *adInstl;

@end

@implementation MenuScrollView


- (id)initWithItems:(NSArray *)items frame:(CGRect)frame delegate:(id<MenuViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.backgroundColor = [UIColor clearColor];
        self.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        _buttonCounts = [items count];
        _menuScrollViewDelegate = delegate;
        originalFrame = frame;
        
        UIImage *adButtonImage = [AdViewExtTool createImageWithColor:[UIColor whiteColor]];
        [self creatAdButtonImage:adButtonImage adapterNameConfig:items];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
        [self orientationWhenInit];
        return self;
    }
    return nil;
}

- (void)orientationWhenInit
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
            [self refreshHorizontalLayout];
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
            [self refreshVerticalLayout];
            break;
        default:
            break;
    }
}

- (void)doRotateAction:(NSNotification *)notification
{
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait)  /*竖屏*/
    {
        [self refreshHorizontalLayout];
    }
    else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft ||
             [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight) /*横屏*/
    {
        [self refreshVerticalLayout];
    }
    else
    {
        
    }
}

- (void)creatAdButtonImage:(UIImage *)adButtonImage adapterNameConfig:(NSArray *)adapterArry      /*根据按钮数量创建按钮,创建之后再排列*/
{
    for (int i = 0; i < [adapterArry count]; i++)
    {
        UIButton * adButton = [UIButton buttonWithType:UIButtonTypeCustom];
        adButton.tag = 10000 + i;
        [adButton setBackgroundImage:adButtonImage forState:UIControlStateNormal];
        [[adButton titleLabel] setAdjustsFontSizeToFitWidth:YES];
        [adButton setTitle:[adapterArry objectAtIndex:i] forState:UIControlStateNormal];
        [adButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [adButton addTarget:self action:@selector(adButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: adButton];
        adButton.layer.borderWidth = 1.0;
        adButton.layer.cornerRadius = 5.0;
    }
}
//竖屏幕Button布局
- (void)refreshHorizontalLayout
{
    int i = 0;
    float width  = originalFrame.size.width / 5;
    for (UIButton * button in self.subviews)
    {
        button.frame = CGRectMake(width + i % 2 * width * 2 - 11, i / 2 * 50 + 5 , width + 20, 35);
        if (_buttonCounts % 2)
        {
            self.contentSize = CGSizeMake(self.contentSize.width, (_buttonCounts / 2 + 1) * HIGH_EACH_ROW);
        }
        else
        {
            self.contentSize = CGSizeMake(self.contentSize.width, _buttonCounts / 2 * HIGH_EACH_ROW);
        }
        CGPoint center = button.center;
        button.bounds = CGRectMake(0, 0, button.bounds.size.width + 10, button.bounds.size.height);
        button.center = CGPointMake(center.x, center.y);
        i++;
    }
}
//横屏幕Button布局
- (void)refreshVerticalLayout
{
    return;
    if (iOS8)
    {
        int i = 0;
        float width = originalFrame.size.width / 7;
        for (UIButton * button in self.subviews)
        {
            button.frame = CGRectMake(width + i % 3 * width * 2.5  , i / 3 * 50 + 5 , 2 * width  , 35);
            if (_buttonCounts % 3)
                self.contentSize = CGSizeMake(self.contentSize.width, (_buttonCounts / 3 + 1)* HIGH_EACH_ROW + 10);
            else
                self.contentSize = CGSizeMake(self.contentSize.width, _buttonCounts / 3 * HIGH_EACH_ROW + 10);
            CGPoint center = button.center;
            button.bounds = CGRectMake(0, 0, button.bounds.size.width , button.bounds.size.height);
            button.center = CGPointMake(center.x, center.y);
            i++;
        }
    }
    else
    {
        int i = 0;
        float width = originalFrame.size.height / 7;
        for (UIButton * button in self.subviews)
        {
            button.frame = CGRectMake(width + i % 3 * width * 2.5  , i / 3 * 50 + 5 , 2 * width  , 35);
            if (_buttonCounts % 3)
                self.contentSize = CGSizeMake(self.contentSize.width, (_buttonCounts / 3 + 1)* HIGH_EACH_ROW + 10);
            else
                self.contentSize = CGSizeMake(self.contentSize.width, _buttonCounts / 3 * HIGH_EACH_ROW + 10);
            CGPoint center = button.center;
            button.bounds = CGRectMake(0, 0, button.bounds.size.width , button.bounds.size.height);
            button.center = CGPointMake(center.x, center.y);
            i++;
        }
    }
}

- (void)adButtonClick:(UIButton *)sender
{
    [_menuScrollViewDelegate tapMissionButton:sender.tag - 10000];
    
}

#pragma mark -
#pragma mark delegate

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

@end
