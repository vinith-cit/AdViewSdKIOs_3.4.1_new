//
//  AdViewLabel.m
//  AdViewAll
//
//  Created by ZhongyangYu on 14-9-26.
//  Copyright (c) 2014年 unakayou. All rights reserved.
//

#import "AdViewLabel.h"
#import "AdViewExtTool.h"

@implementation AdViewLabel

- (instancetype)init
{
    if (self = [super init])
    {
        [self setUserInteractionEnabled:YES];
        [self setTextColor:[UIColor whiteColor]];
        [self setTextAlignment:NSTextAlignmentCenter];
    }
    return self;
}

- (void)setColor:(NSString *)backgroundColor
{
    self.backgroundColor = [AdViewExtTool hexStringToColor:backgroundColor];
}

@end
