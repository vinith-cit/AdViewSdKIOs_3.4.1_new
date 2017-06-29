//
//  ShowBannerViewController.h
//  AdViewAll
//
//  Created by unakayou on 14/10/30.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdViewController.h"

@interface ShowBannerViewController : UIViewController <AdViewControllerDelegate>

@property (nonatomic, strong) IBOutlet UIButton * requestAd;
@property (nonatomic, strong) IBOutlet UIButton * otherAds;
@property (nonatomic, strong) IBOutlet UIButton * changeLocation;

@property (nonatomic, strong) IBOutlet UIButton * sizeButton;
@property (nonatomic, strong) IBOutlet UILabel  * infoLabel;

- (IBAction)requestNewAd:(id)sender;
- (IBAction)requestOtherAd:(id)sender;
- (IBAction)changeLocation:(id)sender;

- (IBAction)changeAdSize:(id)sender;
- (IBAction)testSwitch:(id)sender;

@end
