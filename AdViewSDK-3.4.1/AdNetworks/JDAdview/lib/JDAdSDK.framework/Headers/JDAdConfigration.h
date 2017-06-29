//
//  JDAdViewConfigration.h
//  JDAdSDKDemo
//
//  Created by Ben Miao on 15/11/7.
//  Copyright © 2015年 com.jd.dm. All rights reserved.
//

#ifndef JDAdViewConfigration_h
#define JDAdViewConfigration_h

typedef NS_ENUM(NSUInteger, JDAdType) {
    JDAdTypeBanner,
    JDAdTypeModal,
    JDAdTypeNative,
    JDAdTypeOthers
};

typedef NS_ENUM(NSUInteger, ModalAdSize) {
    Modal_320_480,
    Modal_600_500,
    Modal_640_960,
};

typedef NS_ENUM(NSUInteger, BannerAdSize) {
    Banner_320_48,
    Banner_320_50,
};

typedef NS_ENUM(NSUInteger, BannerPosition) {
    BannerLocateBottom,
    BannerLocateTop,
    BannerLocateCustom
};

typedef NS_ENUM(NSUInteger, JDAdURLResponseStatus)
{
    JDAdURLResponseStatusSuccess, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的RTApiBaseManager来决定。
    JDAdURLResponseStatusErrorTimeout,
    JDAdURLResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};

typedef NS_ENUM(NSUInteger, JDAdNativeType) {
    NativeTypeObject,
    NativeTypeDictionary,
};

typedef NS_ENUM(NSUInteger, JDAdDefineGender) {
    JDAdGenderMale,
    JDAdGenderFemale
};

#endif /* JDAdViewConfigration_h */
