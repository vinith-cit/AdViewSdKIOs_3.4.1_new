//
//  SimpleToolViewController.h
//  AdViewHello
//
//  Created by laizhiwen on 10-12-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdViewController.h"

@class AdViewView;
@interface SimpleToolViewController : UIViewController<AdViewControllerDelegate> {
	UIInterfaceOrientation currLayoutOrientation;
    
    int         nAdViewCount;
}

@property (nonatomic, retain) IBOutlet UIButton * requestNewAd;
@property (nonatomic, retain) IBOutlet UIButton * rollOver;

@property (nonatomic,readonly) UILabel *label;

@property (nonatomic,assign) BOOL               bAutoExit;
@property (nonatomic,assign) NSTimeInterval     autoExitDelay;
@property (nonatomic,strong) NSArray *adViewKeys;

- (IBAction)requestNewAd:(id)sender;
- (IBAction)rollOver:(id)sender;

- (IBAction)changeAdSize:(id)sender;

- (IBAction)testSwitch:(id)sender;



@end
