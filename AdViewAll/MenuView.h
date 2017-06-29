//
//  MenuView.h
//  AdWallMenu
//
//  Created by unakayou on 13-7-26.
//  Copyright (c) 2013年 于. All rights reserved.
//  单平台展示页面

#import <UIKit/UIKit.h>
#import "AdViewExtTool.h"

@class MenuScrollView;

#pragma mark menuViewProtocol
@protocol MenuViewDelegate <NSObject>   /*菜单页面的相关协议方法*/

@required

/**
 *点击某个任务
 */
- (void)tapMissionButton:(NSInteger)number;

- (void)tapDissmissMenuView;

@end

#pragma mark -
#pragma mark MenuView
@interface MenuView : UIView  /*菜单的底层View*/

/**
 *菜单初始化方法  请勿给出超过iPhone或iPad屏幕大小的尺寸，否则将不会显示界面
 */
- (id)initWithMenuFrame:(CGRect)frame itemArray:(NSArray *)items delegate:(id<MenuViewDelegate>)delegate;

@end



#pragma mark -
#pragma mark MenuScrollView
@interface MenuScrollView : UIScrollView      /*菜单底层View上的滑动页面*/

- (id)initWithItems:(NSArray *)item frame:(CGRect)frame  delegate:(id<MenuViewDelegate>)delegate;

@end
