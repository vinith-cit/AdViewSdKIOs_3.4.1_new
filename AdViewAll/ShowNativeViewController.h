//
//  ShowNativeViewController.h
//  AdViewAll
//
//  Created by 周桐 on 16/1/17.
//  Copyright © 2016年 unakayou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowNativeViewController : UIViewController

//平台序号
@property (nonatomic,assign) int adIndex;

@property (strong, nonatomic) IBOutlet UIButton *previousAdBtn;
@property (strong, nonatomic) IBOutlet UIButton *nextAdBtn;

- (IBAction)requestAd:(id)sender;
- (IBAction)closeAd:(id)sender;
- (IBAction)previousAd:(id)sender;
- (IBAction)nextAd:(id)sender;

@end
