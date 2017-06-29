//
//  AdVideoAdapterDomob.m
//  AdViewDevelop
//
//  Created by maming on 16/9/14.
//  Copyright © 2016年 maming. All rights reserved.
//

#import "AdVideoAdapterDomob.h"
#import "AdViewAdNetworkRegistry.h"
#import "AdViewAdNetworkConfig.h"
#import "adViewLog.h"
#import "AdVideoManagerImpl.h"
#import "AdVideoManagerDelegate.h"

@implementation AdVideoAdapterDomob
@synthesize failedLoad;

+ (AdVideoAdNetworkType)networkType {
    return AdVideoAdNetworkTypeDomob;
}

+ (void)load {
    if (NSClassFromString(@"IndependentVideoManager") != nil) {
        [[AdViewAdNetworkRegistry sharedVideoRegistry] registerClass:self];
    }
}

- (BOOL)loadAdVideo:(UIViewController *)controller {
    Class videoManagerClass = NSClassFromString(@"IndependentVideoManager");
    if (nil == videoManagerClass) return NO;
    
    NSString *appID = self.networkConfig.pubId;
    
    self.manager = [[IndependentVideoManager alloc] initWithPublisherID:appID];
    self.manager.delegate = self;
    self.manager.disableShowAlert = YES;
    self.rootController = controller;
    self.isFinishLoad = NO;
    [self.manager checkVideoAvailable];
    
    return YES;
}

- (BOOL)showAdVideo:(UIViewController *)controller {
    if (nil == self.manager) {
        AWLogInfo(@"No video object(Domob) exist!");
        return NO;
    }
    
    if ([self.adVideoManager isReady]) {//domob没有isReady用聚合isReady辅助
        if (nil == controller) {
            [self.manager presentIndependentVideo];
        }else {
            [self.manager presentIndependentVideoWithViewController:controller];
        }
        return YES;
    }
    
    return NO;
}

- (void)stopBeingDelegate {
    AWLogInfo(@"Domob video object stopBeingDelegate");
    self.manager.delegate = nil;
    self.manager = nil;
    self.rootController = nil;
    self.isFinishLoad = NO;
}

#pragma mark - IndependentVideoManagerDelegate 

- (void)ivManagerDidClosed:(IndependentVideoManager *)manager {
    AWLogInfo(@"domob closed");
    [adVideoManager adapter:self didGetEvent:VideoEventType_Close_PlayEnd error:nil];
}

- (void)ivManagerWillPresent:(IndependentVideoManager *)manager {
    AWLogInfo(@"domob present");
}

- (void)ivManagerDidStartLoad:(IndependentVideoManager *)manager {
    AWLogInfo(@"domob didstartLoad");
    [adVideoManager adapter:self didGetEvent:VideoEventType_StartLoadAd error:nil];
}

- (void)ivManagerCompletePlayVideo:(IndependentVideoManager *)manager {
    AWLogInfo(@"domob completePlayVideo");
    [adVideoManager adapter:self didGetEvent:VideoEventType_EndPlay error:nil];
}

- (void)ivManager:(IndependentVideoManager *)manager failedLoadWithError:(NSError *)error {
    AWLogInfo(@"domob failedLoad");
    if (failedLoad) return;
    failedLoad = YES;
    manager.delegate = nil;
    [adVideoManager adapter:self didGetEvent:VideoEventType_FailLoadAd error:error];
}

- (void)ivManagerDidFinishLoad:(IndependentVideoManager *)manager finished:(BOOL)isFinished {
    AWLogInfo(@"domob didFinishLoad:%d",isFinished);
    if (self.isFinishLoad) return;
    self.isFinishLoad = YES;
    [adVideoManager adapter:self didGetEvent:VideoEventType_DidLoadAd error:nil];
}

- (void)ivManager:(IndependentVideoManager *)manager isIndependentVideoAvailable:(IndependentVideoAvailableState)availableState {
    AWLogInfo(@"domob status:%d",availableState);
    if (availableState == eIVVideoStateNoExist) {
        if (failedLoad) return;
        failedLoad = YES;
        [adVideoManager adapter:self didGetEvent:VideoEventType_FailLoadAd error:nil];
    }
}

- (void)ivManagerPlayIndependentVideo:(IndependentVideoManager *)manager withError:(NSError *)error {
    AWLogInfo(@"domob failShow");
    [adVideoManager adapter:self didGetEvent:VideoEventType_FailShow error:error];
}
@end
