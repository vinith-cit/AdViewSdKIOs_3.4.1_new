### AdView IOS SDK Brochure  for  Developers


## Contents

[I.Register and get SDK](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#iregister-and-get-sdk)

[II.Add  SDK](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#iiadd--sdk)	

[III.Create banner ads](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#iiicreate-banner-ads)	

[IV.Create interstitial ads](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#ivcreate-interstitial-ads)

[V.Create open screen ads](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#v-create-open-screen-ads)

[VI. Create native ads](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#vi-create-native-ads)

[VII.Create video ads](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#viicreate-video-ads)	

[VIII.Create direct advertising, exchanging advertising and  their campaigns](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#viiicreate-direct-advertising-exchanging-advertising-and--their-campaigns)

[IX.Configurate Xcode project](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#ixconfigurate-xcode-project)

[X. AdView background app settings](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#x-adview-background-app-settings)	

[XI.Configurate files offline](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#xiconfigurate-files-offline)

[XII.Delete the unnecessary ad platforms](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#xiidelete-the-unnecessary-ad-platforms)	

[XIII.Add customized ad platform (interstitial)](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#xiiiadd-customized-ad-platform-interstitial)	

[XIV.FAQ](https://github.com/vinith-cit/AdViewSDK-IOS-README-File-Imp#xiv-faq)	




## I.Register and get SDK

1.Visit AdView’s website http://www.adview.com to register an account.

2.Login and select “Publise app” in “My Product”

3.Select “iOS” as application platform, complete the relative information according to the prompts and you will get the unique SDK key.

4.Configurate your app in “App Management” , enter the ad ID of the platform in “unset” , turn on the switch , set the total ad amout to 100%, then save. If more platfomrs are needed, click “add ad platform”  in the upper right conner. We suggest the amout of the platform is usually 1 to 3.

![SDK key](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/1.1.png)


5.Home-> iOS SDK download, or App Management -> iOS SDK download, you can get AdViewSDK iOS kit there.

![SDK key](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/1.2.png)


6.Integrated iOS SDK is a mobile ad optimizer specially provide to iOS developers for free, aiming at helping developers easily maximize their ad revenues. Based on the App mutual push of ad integration, it helps increasing users for the apps rapidly. At the meantime we combine with lots of ad platforms and app stores, opening a green channel to serve the developers.

![SDK files](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/1.3.png)



Integrated iOS SDK includes the following contents:

|  File or category name  | Intruductions |
| --- | --- |
| AdView |   AdView  integrated SDK development kit |
| AdNetworks |  Interstitial ad development kit supported by integrated SDK  |
| Libs |   Sourse library needed by integrated kit |
| Doc |  Integrated SDK resources includes: update log, user brochure, current version, precautions and other documents.  |
| AdViewToolLevel |   Auxiliary integration tool  for banner |


	

      

  **Instructions:**

  1.	The SDK we provide allow you to select your faviour ad companies, apart from complement auction, other ad platforms are all from third parties. You need to register and apply for the needed App Keys for the ads in these platforms’ official websites, and configurate them to the corresponding platforms of AdView’s background.
  
  2.	If you are fresh and learn little about ad platform, either don’t know which ad platform to choose or which ad platform has stable revenue, AdView suggests you use bidding to see the effect first.
  
  3.	Bidding and complement ads need to complete marker information at the background, and formal ads can be acquired after the approval and will start counting fees. Before that all the ads are for test, which are not charged.
  
  4.	Switch: Only the ads of which platforms’ switchs are on will be shown in  the app.
  
  5.	Advertising amount: only the advertisings of which switchs are on make sense. The ad amout is based on the request priority of the ad platforms. Usually those with  high proportion get the prior request. The ad amount should be adjusted while shift ad platforms, and the total amount of app advertisings of which status are “on”  should be 100, otherwise they cannot be correctly saved.
  
  6.	Banner ads, interstitial/full screen ads, open screen ads and so on, there is a “save” button under each page of them. You should click “save”, otherwise your edit is invalid.
  
  7.	Region optimization：To use region optimization function, the phones at home will show the domestic configurated ads while the phones at aborad will show the foreign configurated ads, thus to meet the different demands to the largest extent. When the region optimizaiton is off, it will not tell apart at home or at abroad.
  
  8.	If you use video ads, create video ad slot as the image: ( the same for native ads)
  **Note:**
  ① remember to click “save” after completing video ad slot.
  ② the successfully created app will generate “video ad slot ID” (the video biding ad in the integration function do not need to fill in ad slot ID). 
    Position of video ad slot ID: App Management— edit – video ad slot module
    
    
![Video Id](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/1.4.png)
    
    
    
## II.Add  SDK

  It’s easy to integrate the integrated SDK in a project, usually you can integrate AdInstl into your project by the following steps:
  
  1）Get AdViewSDK development kit from the website and unzip it in Finder. You will see the unzipped AdViewSDK in Finder just like the image shows:
  
  ![SDK Zip0](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/2.1.png)

  

  2）Open your project in Xcode, here we take the AdViewAll project along with AdViewSDK as an example.
  
  
  
    ![SDK Zip1](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/2.2.png)
    
    

     

  3）Drag the AdViewSDK catalog into the AdViewAll project in the Finder.   
  
  ![Drag SDK](https://github.com/vinith-cit/images-for-ios-SDK/blob/master/2.3.png)
  

  4）Select  “Copy items into destination group’s folder (if needed)” in the pop-up dialog，and AdViewSDK will be added to your project after finish like the image shows:
  
  ![AdView SDK](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/2.4.png)

  5）Some platforms have some restrictions for Xcode version or SDK version, if you can’t meet the demands please don’t connect the platform.

  6）AdViewSDK  development kit is accompanied with all the supported ad platforms, but there may be some symbol conflict among some ad platforms, so at this time you have to give up some ad platforms. The conflict in these platforms please refer to ReadMe.txt.

  7）Others：
  The project frame of AdViewSDK is adjusted to ARC model（start from 3.1.0 version）, when use non-ARC project please add the “fno-objc-arc” tag  to the corresponding files. AdViewSDK do not directly use geography information， but ad SDK may use. 
  Some ad platforms may repeatedly import certain files which may result in the duplicate compilation or conflict issues, more details please refer to ReadMe.txt document.

  8）Registration & Configuration：
  You should create AdViewConfigStore object and register banner, interstitial and other configurations before the initialization of banner, interstitial or other ads. We suggest write it down in the methods of **(BOOL)application:didFinishLaunchingWithOptions** in **AppDelegate.**
  
  
  ```

  \\The key of the requested ad must within the configuration of the registration. 
      AdViewConfigStore *cfg = [AdViewConfigStore sharedStore];
      [cfg requestConfig:@[@"SDK20111022530129m85is43b70r4iyc",@"SDK20150903090237sjtskjva8ppy91r"]           sdkType:AdViewSDKType_Banner];
      [cfg requestConfig:@[@"SDK20141430020730kbmya6prn5qg1t0",@"SDK20150903090237sjtskjva8ppy91r"] sdkType:AdViewSDKType_Instl];
      [cfg requestConfig:@[@"SDK20151311010501u7hth0gexjm9gym",@"SDK20150903090237sjtskjva8ppy91r"] sdkType:AdViewSDKType_SpreadScreen];
      
   ```   

## III.Create banner ads

  1）Complete  Delegate of AdView in the interface where need to insert banner, just like the below codes show: 

  ```
  #import <UIKit/UIKit.h>
  #import "AdViewView.h"
  @interface BannerViewController : UIViewController<AdViewDelegate>
  {
       AdViewView *adView;
  }
  @property (nonatomic,retain)AdViewView *adView;
  @end

  ```

  2）Complete AdViewDelegate，as the below codes show:
  
  ```

  - (UIViewController*)viewControllerForPresentingModalView
  {
      return [UIApplication sharedApplication].keyWindow.rootViewController ;
  }
  
  
  /**
   * Whether the user requires an output log, which was previously synchronized with adViewTestMode and can now be enabled      *separately
   */
  - (BOOL)adViewLogMode
  {
      return YES;
  }
  
  ```

  3）Create AdInstlManager in the viewDidLoad function of the controller, use the Application Key acquired in step 1, just as the below codes show:
  
  ```
  - (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        self.view.backgroundColor =[UIColor blueColor];
        self.adView = [AdViewView requestAdViewViewWithAppKey:@"SDK201416200410555y9p0pjcph5f5ue" WithDelegate:self];
        [self.view addSubview:self.adView];
  }
  
  ```

## IV.Create interstitial ads
  
  1）Complete Delegate of interstitial in where need to insert interstitial ads. If you use interstitial in different interface, you can complete only once in AppDelegate object, and provide an external way to call the location.
  

```
    #import <UIKit/UIKit.h>
    #import "AdInstlManager.h"
    #import "AdInstlManagerDelegate.h"
    
    @interface InstlViewController : UIViewController <AdInstlManagerDelegate>
        @property (nonatomic, strong) AdInstlManager * adInstlManager;
    @end
    
```


 2）Complete interstitial Delegate，as the below codes show:
 
  
  ```
  -(void)adInstlManager:(AdInstlManager*)manager didGetEvent:(InstlEventType)eType error:(NSError*)error
  {
   switch (eType) {
      case InstlEventType_DidLoad:
      break;
      
     case InstlEventType_FailLoadAd:
     break;
     
     default:
     break;
        }
   }
   
 - (BOOL)adInstlTestMode
 {
    return NO;
 }
  
- (BOOL)adInstlLogMode {
    return YES;
 }
  
  ```
  
  

  3）Create AdInstlManager in the viewDidLoad function of the controller, as the below codes show:

```
  - (void)viewDidLoad
  {
      [super viewDidLoad];
  self.adInstlManager=[AdInstlManager managerWithAdInstlKey:@" SDK
  201416200410555y9p0pjcph5f5ue"WithDelegate:self];
  }
  
```


  4）Add ad load codes in the proper position, as the below codes: 
  

```
 - (void)adInstlLoad:(id)sender
  {
      // Since interstitial ads have certain life cycle, so don' be too late to call (showAdInstlView:) after load, in case           the ads get invalid.
      BOOL bRet = [self.adInstl loadAdInstlView:self];
      
   }
   
```

  5）Add the ad impression codes in the proper position like the below codes: 
  
```
  - (void)adInstlShow:(id)sender
  {
      BOOL bRet = NO;
      if ([self.adInstl isReady])
          bRet = [self.adInstl showAdInstlView:self];
  }
```

## V. Create open screen ads
  
  1）Insert  open screen object in AppDelegate and the generate the  open screen object, as the below codes: 
  
 ```
  #import <UIKit/UIKit.h>
  #import "AdSpreadScreenManager.h"
  #import "AdSpreadScreenManagerDelegate.h"
  @interfaceAppDelegate:UIResponder <UIApplicationDelegate,AdSpreadScreenManagerDelegate>
  	@property (strong, nonatomic) UIWindow *window;
 	@property (strong, nonatomic) AdSpreadScreenManager *manager;
  @end
  
 ```

  2）Create AdSpreadScreenManager  in Application of AppDelegate  as the below codes:
  
  
 ```
  (BOOL)application:(UIApplication*)applicationdidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
  {
          self.manager=[AdSpreadScreenManager managerWithAdSpreadScreen
  Key:@"SDK20141023100445zhgsncda3wciah6" WithDelegate:self];
        [self.manager requestAdSpreadScreenView:self.window.rootViewController];
        return YES;
   }
   
   ```

  3）Complete open screen Delegate as the below codes:
  
  ```
  /**
   * Information callback
   */
  -(void)adSpreadScreenManager:(AdSpreadScreenManager*)manager didGetEvent:(SpreadScreenEventType)eType error:   
    (NSError*)error{
 
     }
     
  /**
   * Get configuration callback notification
   */
  - (void)adSpreadScreenDidReceiveConfig:(AdSpreadScreenManager*)manager {}
  
  /**
   * Configure all invalid or empty notifications
   */
  -(void)adSpreadScreenReceivedNotificationAdsAreOff:(AdSpreadScreenManager*)manager {}
  
  /**
   * Whether to open the test mode，The default is NO
   */
  - (BOOL)adSpreadScreenTestMode {
      return YES;
  }
  
  
  /**
   * Whether to open the log mode, the default is NO
   */
  - (BOOL)adSpreadScreenLogMode {
      return NO;
  }
  
  /**
   * Whether to get the location, the default is NO
   */
  - (BOOL)adSpreadScreenOpenGps {
      return NO;
  }
  
  /**
   * Whether to use html5 ads, the default is NO
   */
  - (BOOL)adSpreadScreenUsingHtml5
  {
      return NO;
  }
  
  - (UIWindow *)adSpreadScreenWindow {
      return self.window;
  }
  
  - (NSString *)adSpreadScreenLogoImgName {
      return @"Adview_Logo.jpg";
  }
  
  - (UIColor *)adSpreadScreenBackgroundColor {
      return [UIColor whiteColor];
  }
  
 ```
  

## VI. Create native ads

1）Complete Delegate of native ads in where need to insert native ads. If you use native ads in different interface, you can complete AppDelegate only one time, and provide external method to call positions.

```
  #import "AdNativeManager.h"
  #import "AdNativeManagerDelegate.h"
  @interface ShowNativeViewController()<AdNativeManagerDelegate>
  
  @property (nonatomic,strong) AdNativeManager *nativeManager;
  
  @end
  
  ```

2）Complete native Delegate as the below codes：

```
 - (void)requestNativeAdSuccessed:(AdNativeManager*)manager adInfo:(NSArray*)adviewNativeAdArray{
       self.adArr = adviewNativeAdArray;
       self.adCountIndex = 0;
       self.label.text = @"Request ad is successful";
       [self createNativeAdView];
} 
- (BOOL)adNativeTestMode{
    return NO;
}
- (BOOL)adNativeLogMode {
    return YES;
}

```

3）Create AdNativeManager in the viewDidLoad function of the controller，as be below codes:

```
- (void)viewDidLoad
{
[super viewDidLoad];
self.nativeManager=[AdNativeManager managerWithAdNativeKey:NATIVEKEY WithDelegate:self]; 
}

```


4）Add ad load codes in the proper position, as the below codes show: 

```
- (IBAction)requestAd:(id)sender {
    if (self.adIndex) {
        [nativeManager loadSingleAdNative:3 withIndex:self.adIndex];
    }else{ 
        [nativeManager loadNativeAd:3];
    }
 }

```

5）Add ad impression report codes in proper position:

```
- (void)adNativeShow:(id)sender 
{
   AdViewNativeAdInfo *info = [self.adArr objectAtIndex:self.adCountIndex];
   UIImage *iconImage = [UIImage imageWithData:[NSData
   dataWithContentsOfURL:[NSURL URLWithString:[info.nativeAdDict objectForKey:AdViewNativeAdIconUrl]]]];
   UIImageView *iconImgView = [[UIImageView alloc] initWithImage:iconImage];
   [showView addSubview:iconImgView];
   [info showNativeAdWith:showView]; 
} 

```

6） Add ad click report codes in proper position: 

```
- (void)click{
    [[self.adArr objectAtIndex:self.adCountIndex]clickNativeAd];
}

```

## VII.Create video ads

1)Complete Delegate of  the video in where need to insert video. If you use video in different interface, you can complete only one time in AppDelegate object, and provide external method to call positions.

```

#import "AdVideoManager.h"
#import "AdVideoManagerDelegate.h"
@interface VideoViewController()<AdVideoManagerDelegate>
	@property (nonatomic,strong) AdVideoManager *videoManger;
@end
  
```

2）Complete videoDelegate，as the below codes show：

```
 /**
 * Information callback
 */
 
- (void)adVideoManager:(AdVideoManager*)manager didGetEvent:(VideoEventType)eType error:(NSError*)error{
    if (eType == VideoEventType_DidLoadAd) {
        [manager showVideoAdWithController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
 }

/**
 *
 */
- (void)adVideoManager:(AdVideoManager*)manager videoAvailable:(BOOL)avilable{}

/**
 * Whether to open the test mode, the default is NO
 */
- (BOOL)adVideoTestMode{
    return NO;
}


/**
 * Whether to open the log mode, the default is NO
 */
- (BOOL)adVideoLogMode{
    return YES;
}

```


3）Create AdVideoManager in the viewDidLoad function of the controller, as the below codes show:

```
- (void)viewDidLoad
{
    [super viewDidLoad];
     self.videoManger = [AdVideoManager managerWithAdVideoKey:NATIVEKEY WithDelegate:self]; 
}

```

4）Add ad load codes in proper position: 

```
- (void)showVideo
{
    [self.videoManger loadVideoAd:self];
}
```

5）Add ad dislplay and report codes in proper position: 

```
/**
 * Information callback
 */
- (void)adVideoManager:(AdVideoManager*)manager didGetEvent:(VideoEventType)eType error:(NSError*)error{
    if (eType == VideoEventType_DidLoadAd) {
        [manager showVideoAdWithController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
}

```

## VIII.Create direct advertising, exchanging advertising and  their campaigns

1.Login Adview’s official website and enter publishers end,  Ads management → creative database：

![Create DB](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/7.1.png)

2.Click ”Create creatives” button and enter the information needed. When create H5 ads, you must add the <a href=””></a> tag in HTML codes, otherwise no clicks will be triggered after the ads are shown. Take direct ad for example:

![Comment Box](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/7.2.png)

3.Enter the interface of creating direct ads and fill in the information. Once saved, your direct ad is finished created. 
![Editig](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/7.3.png)

4.Now you can see the direct ad created in the ads management, you just have to wait for our staff to audit your ad. Once approved you can start your campaign.
![Application](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/7.4.png)

5.Enter the campaign interface, click setting and start your campaign（投The release amount must reach 100%）.
![Percentage](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/7.5.png)

6)The steps of creating exchanging ad is the same as the direct ad. 

## IX.Configurate Xcode project

1.set the value of Other Linker Flags in the project , and tag “-ObjC”

2.add AdViewSDK  and the framework needed  in your project.	

    --> libsqlite3.tbd
    
    -->libz.tbd
    
    -->libc++.tbd —Optional
    
    -->Metal.framework —Optional
    
    -->MapKit.framework
    
    -->MobileCoreServices.framework
    
    -->libstdc++.tbd —Optional
    
    -->PassKit.framework —Optional
    
    -->Social.framework —Optional
    
    -->AudioToolbox.framework
    
    -->AddressBook.framework
    
    -->AVFoundation.framework
    
    -->AdSupport.framework--Optional
    
    -->CoreGraphics.framework
    
    -->CoreLocation.framework
    
    -->CoreMedia.framework
    
    -->CoreMotion.framework
    
    -->CoreTelephony.framework
    
    -->CoreVideo.framework
    
    -->ImageIO.framework
    
    -->MediaPlayer.framework
    
    -->MessageUI.framework
    
    -->QuartzCore.framework
    
    -->EventKit.framework
    
    -->EventKitUI.framework
    
    -->Foundation.framework
    
    -->Security.framework
    
    -->StoreKit.framework--Optional
    
    -->SystemConfiguration.framework
    
    -->UIKit.framework
    
    -->Twitter.framework
    
    -->AssetsLibrary.framework
    
    -->Accounts.framework
    
    -->WebKit.framework
    
    -->libxml2.tbd

**Note:**

the below contents are the framework needed by various ad platforms ( framework of Adview must add)

|  	Ad platform              |     Framework                                                      |
| ------------------------------ | ------------------------------------------------------------------ |
| AdView                         |   AdSupport.framework(optional) CoreLocation.framework|
|                                | AddressBook.framework      libc++.tbd(optional) |
|                                |	libsqlite3.tbd               libxml2.tbd |
| AdChina（易传媒）                | AudioToolbox.framework      AVFoundation.framework |
|                                 | CoreGraphics.framework      CoreLocation.framework |
|		                 | CoreMotion.framework        CoreTelephony.framework |
|		                 | EventKit.framework           EventKitUI.framework |
|		                 |  	Foundation.framework        libz.tbd |
|	        	         | MapKit.framework            MediaPlayer.framework |
|		                 |  MessageUI.framework        QuartzCore.framework |
|		                 |  SystemConfiguration.framework  |
|		                 |  	StoreKit.framework           UIKit.framework |
|		                 |  libiconv.2.4.0.tbd            libsqlite3.0.tbd |
|		                 | libc++.tbd(optional)  |
| InMobi                         | CoreLocation.framework        EventKit.framework |
|                 | EventKitUI.framework          Social.framework |
|		 | libz.tbd                      AdSupport.framework |
|		 | AudioToolbox.framework       AVFoundation.framework |
|		 |  CoreGraphics.framework       CoreTelephony.framework |
|		 | 	Foundation.framework          MediaPlayer.framework |
|		 |  MessageUI.framework |
|		 |   	PassKit.framework(optional)             QuartzCore.framework  |
|		 |  	Security.framework             StoreKit.framework(optional) |
|		 | 	SystemConfiguration.framework |
|		 |  UIKit.framework |
|  Adwo（安沃）| AdSupport.framework(optional)AudioToolbox.framework |
|                 | AVFoundation.frameworkore   Audio.framework |
|		 | CoreLocation(optional)        CoreMedia.framework |
|		 | CoreMotion.framework        CoreTelephony.framework |
|		 |  EventKit.framework MapKit.framework |
|		 | 	MessageUI.framework |
|		 |  PassKit.framework(optional) |
|		 |   QuartzCore.framework        StoreKit.framework(optional)  |
|		 |  	SystemConfiguration.framework |
|		 | 	Social.framework(optional) |
|		 | 	libz.1.2.5.tbd or libz.1.1.3.tbd  |	
|  Baidu（百度）  | QuartzCore.framework        Security.framework |
|                | AVFoundation.frameworkore   Audio.framework |
|		 | CoreLocation(optional)        CoreMedia.framework |
|		 | CoreMotion.framework        CoreTelephony.framework |
|		 |  EventKit.framework MapKit.framework |
|		 | 	MessageUI.framework |
|		 |  PassKit.framework(optional) |
|		 |   QuartzCore.framework        StoreKit.framework(optional)  |
|		 |  	SystemConfiguration.framework |
|		 | 	Foundation.framework         CoreGraphics.framework |
|		 | 	WebKit.framework  |	
| Chance（畅思）  | 	libz.tbd                     Security.framework |
|                 | 	SystemConfiguration.framework |
|		 | 	CoreTelephony.framework |
| DianRu（点入)  | 	libz.1.tbd                    QuartzCore.framework |
|                 | 	UIKit.framework               CoreLocation.framework |
|		 | MapKit.framework             SystemConfigfuration.framework |
|		 | 	Foundation.framewrok          CoreGraphics.framework |
|		 |  	AdSupport.framework(optional) |
| Domob（多盟）   | 	libz.tbd                      libsqlite3.tbd |
|                 | 	CoreMedia.framework          QuartzCore.framework |
|		 | CoreText.framework           StoreKit.framework(optional) |
|		 | 	PassKit.framework(optional)    Social.framework |
|		 |  	EventKit.framework            AVFoundation.framework |
|		 | 	AudioToolbox.framework       UIKit.framework |
|		 |  	Systemconfiguration.framework |
|		 |   	Foundation.framework  |
| GTDMob（广点通）  | 	AdSupport.framework          CoreLocation.framework |
|                 | QuarzCore.framework          libz.tbd |
|		 | SystemConfiguration.framework |
|		 | CoreTelephony.framework      StoreKit.framework(optional) |
|		 | Security.framework |
| GuoHe（智游汇）  | SystemConfiguration.framework |
|                 | StoreKit.framework(optional)    AdSupport.framework |
| Guomen（果盟）  | QuartzCore.framework         CoreTelephony.framework |
|                 | SystemConfiguration.framwork |
|		 | UIKit.framework               Foundation.framework |
|		 | CoreGraphics.framework       ImageIO.framework |
|		 |  StoreKit.framework(optional) |
|		 | 	AdSupport.framework(optional) |
|  IAD  | IAD.framework |
| Lmmob（力美）  | AudioToolbox.framework        CFNetwork.framework |
|                 | CoreLocation.framework        CoreTelephony.framework |
|		 | EventKit.framework             EventKitUI.framework |
|		 | MapKit.framework              MediaPlayer.framework |
|		 |  MessageUI.framework |
|		 | 	MobileCoreServices.framework |
|		 |  QuartzCore.framework          Security.framework |
|		 |   	AdSupport.framework(optional)  |
|		 |  	SystemConfiguration.framework |
|		 | 	libz.1.2.5.tbd |  
| Miidi（米迪）  | CoreGraphics.framework |
|                 | QuartzCore.framework |
|		 | MessageUI.framework |
|		 | SystemConfiguration.framework |
|		 |  AdSupport.framework(optional) |
| MobiSage（艾德思齐）  | Foundation.framework |
|                 | AdSupport.framework(optional) |
|		 | StoreKit.framework(optional)    CoreMotion.framework|
|		 | MobileCoreServices.framework  QuartzCore.framework |
|		 |  CoreAudio.framework          CoreImage.frramework |
|		 | AudioToolbox.framework       AVFoundation.framework |
|		 | ImageIO.framework             CoreMedia.framework |
|		 |   	QuartzCore.framework          Security.framework  |
|		 |  	CoreGraphics.framework        QuartzCore.framework |
|		 | 	CoreLocation.framework        Libz.tbd |
|		 |  CoreTelephony.framework |
|		  | MessageUI.framework |
| SmartMad  | CFNetwork.framewor           MessageUI.framework |
|            |SystemConfiguration.framework|
|            |EventKiyUI.framgwork          EventKit.framework|
|            |MediaPlayer.framework         QuartzCore.framework|
|            |libz.tbd                      AVFoundation.framework|
|            |CoreTelephonty.framework      AdSupport.framework(optional)|
|            |AudioToolbox.framework        CoreLocaation.framework|
|            |CoreMotion.framework          UIKit.framework|
|            |Foundation.framework          CoreGraphics.framework|
| Tanx（阿里妈妈）  |UIKit.framework                CoreGraphics.framework|
|                        |QuartzCore.framework          Foundation.framework|
|                        |CoreLocation.framework         libz.tbd|
|                        |SystemConfiguration.framework|
|                        |StoreKit.framework(optional)     MapKit.framework|
|                        |MessageUI.framework|
|                        |CoreTelephony.framework|
|Waps（万普）| AdSupport.framework(optional)   QuartzCore.framework|
|            |Security.framework             CoreTelephony.framework|
|            |SystemConfiguratioin.framework|
|            |Libz.tbd|
|WQMobile（帷千）|libsqlite3.tbd                 StoreKit.frameowrk|
|                |UIKit.framework               QuartzCore.framework|
|                |SystemConfiguration.framework|
|		|MobileCoreServices.framework|
|                |MessageUI.framework MediaPlayer.framework|
|                |MapKit.framework             libz.tbd|
|                |Foundation.framwork          EventKit.framework|
|                |EventKitUI.framework          CoreMotion.framework|
|                |CoreLocation.framework       CoreGraphics.framework|
|                |CoreFoundation.framework     FNetwork.framework|
|                |AdSupport.framework(optional)|
|                |CoreTelephony.framework|
|XingYun（行云）|CoreLocation.framework       MapKit.framework|
|               |Security.framework            CFNetwork.framework|
|               |MobileCoreServices.framework|
|               |CoreTelephony.framework    AdSupport.framework(optional)|
|               |SystemConfiguration.framework|
|               |ImageIO.framework           QuartzCore.framework|
|               |UIKit.famework               Foundation.framework|
|               |CoreGraphics|
|YiJiFen（易积分）|ImageIO.framework           QuartzCore.framework|
|                |SystemConfiguration.framework|
|                |StoreKit.framework(optional)       CoreTelephony.framework|
|                |AdSupport.framework(optional)       CoreGraphics.framework|
|                |Eadver.framework             Poundation.framework|
|                |UIkit.framework | 
|YouMi（有米）|storekit.framework(optional)     security.framework|
|             | cfnetwork.framework           ImageIO.framework|
|             |systemconfiguration.framework|
|             |CoreMotion.framework         libz.tbd|
|             |libsqlite3.tbd|

3.When adding SDK, some documents are repeatedly used, you need to delect the repeatedly used documents or do not compile them.The repeated documents includes: OpenUDID.m 、ZipArchive.m 、zip.m 、unzip.m 、mztools.c  ioapi.c  and Reachbility.m

4.Configurate your ads’ interstitial priorities and propotions in AdView’s website.

5.Compile and connect your project and the interstitial can be shown.


## X. AdView background app settings

1)app settings

![App Setting](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/10.1.png)


2)Select ad platform
 
 ![Ad Platform](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/10.2.png)

3)Add ad platform
Select the platform you want
![Selected Platfrom](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/10.3.png)

4)Configuration ad platform

![Configure Platfrom](https://github.com/vinith-cit/images-for-ios-SDK/blob/master/10.4.png)



--> **APP ID settings**
publisher should sign up in relevant  ad platfroms to get the corresponding app information. Since the interfaces of different platforms are different , usually you just need to enter App ID, sometimes may need to enter other information. 

-->**switch** 
Only when the switch is on will the ad be shown. Publishers can shift different  ad platforms.

-->**capacity:** 
Only when the switch is on will the campaign make sense. Capacity is the request proportion to the ad platform. When shift ad platform，the capacity should be adjusted at the same time. The total capacity of  ads whose status are on should be 100, otherwise cannot be saved correctly.

-->**Region optimization**
Region optimization fuction refers to the phones at home show the domestic configurated ads, while phones at abroad show the foreing configurated ads, meeting the different demands to the largest extent. When region optimizaiton is off, it will not tell apart at home or at abroad.

![Region](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/10.5.png)


## XI.Configurate files offline

![configure](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/11.1.png)

1) download offline configurated files

2) put themt into project catagorie
![Project](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/11.2.png)














## XII.Delete the unnecessary ad platforms

It’s quite easy to delete the unnecessary interstitials. You just have to delete  the relevant interstitial files under AdInstlSDK/AdNetworks  in the project and re-compile. 
We suggest only delete the project quote when deleting interstitials from the project, instead of deleting the interstitials from the hardware. Remain the interstitial development library in case for need.

## XIII.Add customized ad platform (interstitial)

Sometimes publisher may want to add an ad platfrom which is not contains in the integration. Adview can realize this demands.
There is “ customize ad platform” in “add ad platform”

![Customize Platform](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/13.1.png)

Publisher should register in relevant platforms first to get the corresponding app information. Since the interfaces of different ad platforms are different, usually you just need to enter app ID, some may need to enter other information. If not, you can randomly enter any characters.

**Codes for reference**

1.Add the  SDK of which platform you would like to  add  to AdNetwork of Xcode.

![AdNetwork](https://raw.githubusercontent.com/vinith-cit/images-for-ios-SDK/master/13.2.png)

2.Create  the category of AdInstlAdNetworkAdapter and complete its Delegate


```
#import "AdInstlAdNetworkAdapter.h"
#import <Walker/GuInitServer.h>
#import <Walker/PobAppFrame.h>
@interface AdInstlAdapterXingYun : AdInstlAdNetworkAdapter<PobAppFrameDelegate>
   @property (nonatomic, weak) UIViewController *rootController;
   @property (nonatomic, strong) GuInitServer * gunInitServer;
   @property (nonatomic, strong) PobAppFrame  * pobAppFrame;
@end

```


3.two ways to complete: one is networkType（to get channel ID, for customized ad usuallly return    *AdInstlAdNetworkTypeUserDefined）. Another one is Load


```
+ (AdInstlAdNetworkType)networkType
{
    return AdInstlAdNetworkTypeXingYun;
}


//@"PobAppFrame"  is the inserted ad name
//sharedInstlRegistry   interstitial 
//sharedBannerRegistry   banner
//sharedSpreadScreenRegistry    open screen

+ (void)load
{
    if (NSClassFromString(@"PobAppFrame") != nil) {
        [[AdViewAdNetworkRegistry sharedInstlRegistry] registerClass:self];
    }
}


```

4.In the load ad (loadAdInstl) method to instantiate the ad and send the ad request

```
- (BOOL)loadAdInstl:(UIViewController *)controller
{
    Class XingYunInstlClass = NSClassFromString(@"PobAppFrame");
    Class XingYunInstlServer = NSClassFromString(@"GuInitServer");
    if(nil == XingYunInstlClass) return NO;
    if (nil == XingYunInstlServer) return NO;
    if (controller == nil) return NO;
    
    self.rootController = controller;
    
    // Accept AppID from the background
    NSString *appID = self.networkConfig.pubId;
    
    // instantiate
    self.gunInitServer = [[XingYunInstlServer alloc] init];
    [self.gunInitServer setInfo:appID Channel:@"" User_info:@""];
    
    // request ads
    self.pobAppFrame = [[XingYunInstlClass alloc] orientation:@"Portrait" andDelegate:self];
    
    //Send a request report to the AdView server, data will collect in Dashboard
    [self.adInstlManager adapter:self requestString:@"req"];
    return YES;
}

```

5.	Complete ad impressions:

```
- (BOOL)showAdInstl:(UIViewController *)controller
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
    if (nil == controller || ![controller isViewLoaded] || [controller isBeingDismissed]) {
        [self.adInstlManager adapter:self requestString:@"fail"];
        [self.adInstlManager adapter:self didGetEvent:InstlEventType_FailLoadAd error:nil];
        return NO;
    }
#else
    if (nil == controller || ![controller isViewLoaded]) {
        [self.adInstlManager adapter:self requestString:@"fail"];
        [self.adInstlManager adapter:self didGetEvent:InstlEventType_FailLoadAd error:nil];
        return NO;
    }
#endif
    if (self.pobAppFrame)
    {
        //Ad display
        [self.pobAppFrame showpobFrame:self.rootController];
        return YES;
    }
    return NO;
}
```

6.	Complete SDK of the inserted ad, add status and report data .

```
 //interstitial pops up successfully 
- (void)showPobFrameSucess
{
	[self.ADINSTLMANAGER Adapter:self didGetEvent:InstlEventType_WillPresentAd error:nil];
        [self.adInstlManager adapter:self 
         requestString:@"show"];
}

//interstitial failed to  pop up 
- (void)showPobFrameFail
{
[self.adInstlManager adapter:self didGetEvent:InstlEventType_FailLoadAd error:nil];
[self.adInstlManager adapter:self requestString:@"fail"];
}

// close interstitial 
- (void)closePobAppFrame
{
	if (self.pobAppFrame) {
	self.pobAppFrame = nil;
    }
   	if (self.gunInitServer) {
   	self.gunInitServer = nil;
 }
	if (self.rootController) {
	self.rootController = nil;
}
	[adInstlManager adapter:self didGetEvent:InstlEventType_DidDismissAd error:nil];
}

// successfully acquired data
- (void)initPobFrameSuccess
{
	[self.adInstlManager adapter:self didGetEvent:InstlEventType_DidLoadAd error:nil];
    [self.adInstlManager adapter:self requestString:@"suc"];
}

// failed to acquired data
- (void)initPobFrameFail
{
[self.adInstlManager adapter:self didGetEvent:InstlEventType_FailLoadAd error:nil];
[self.adInstlManager adapter:self requestString:@"fail"];
}

```

7.to clear up data in stopBeingDelegate

```
- (void)stopBeingDelegate
{
    AWLogInfo(@"xingyun stop being delegate");
    if (self.pobAppFrame) {
        self.pobAppFrame = nil;
    }
    if (self.gunInitServer) {
        self.gunInitServer = nil;
    }
    if (self.rootController) {
        self.rootController = nil;
    }
}

```


 
## XIV. FAQ

Q：why AdInstl  cannot show ads?
A：The most likely reason is that you havenot added additional link  options which enable your interstitial development library to load into your application. You can refer to the 5th step of “insert AdView integration in the interface of the  project”.

Q：Why the project is successfully compiled but some errors occur when connecting? 
A：Due to the characteristics of the Objective-C language, all the static libraries that participate in the connection are not allow to have repeated functions or variables or other symbols. It’s easy to be dealt with if the conflict happens in the interstitials. You just need to pay attention to  in which interstitial ads the conflicts occur.


