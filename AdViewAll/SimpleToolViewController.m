    //
//  SimpleToolViewController.m
//  AdViewHello
//
//  Created by laizhiwen on 10-12-27.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleToolViewController.h"
#import "AdViewExtTool.h"
#import "AdViewConst.h"

static BOOL simpleTool_Test = NO;
static BOOL simpleTool_Log = YES;

static int gSimpAdSize = AdviewBannerSize_Auto;

#define SWITCH_TAG 101

#define BUTTON_SIZE_TAG 11273

@implementation SimpleToolViewController
@synthesize bAutoExit = _bAutoExit;         //used for auto test.
@synthesize autoExitDelay = _autoExitDelay;

@synthesize requestNewAd = _requestNewAd;
@synthesize rollOver = _rollOver;

- (id)init {
	if (self = [super initWithNibName:@"SimpleToolViewController" bundle:nil]) {
		currLayoutOrientation = UIInterfaceOrientationPortrait; // nib file defines a portrait view
//		self.title = @"Simple View";
	}
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.requestNewAd setBackgroundColor:[AdViewExtTool hexStringToColor:RED_COLOR]];
    [self.rollOver setBackgroundColor:[AdViewExtTool hexStringToColor:YELLOW_COLOR]];
    
    [self performSelector:@selector(showAdSizeLabel)];
	
    UIView *view1 = [self.view viewWithTag:SWITCH_TAG];
    if ([view1 isKindOfClass:[UISwitch class]])
        ((UISwitch*)view1).on = simpleTool_Test;
    
    //ad view.
//    UIViewController *rootController = [((AdViewHelloAppDelegate *)[[UIApplication sharedApplication] delegate]) navigationController];
    
    
    nAdViewCount++;
    
    AdViewController *controller = [AdViewController sharedController];
    [controller setAdViewKey:ADBANNERKEY];//@"SDK20111022530129m85is43b70r4iyc"]SDK20150903090237sjtskjva8ppy91r;
    [controller setModeTest:simpleTool_Test Log:simpleTool_Log];
    [controller setOrientationUp:NO Down:NO Left:NO Right:YES];
    [controller setAdBannerSize:gSimpAdSize];
    [controller setAdRootController:self];
    [controller setNotifyDelegate:self];
    [controller setAdPosition:CGPointMake(AD_POS_CENTER, AD_POS_REWIND)];
    [controller loadView];
    [self.view addSubview:controller.adView];
    
    NSLog(@"Frame:%@", NSStringFromCGRect(controller.adView.frame));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [AdViewController deleteController];
}

- (void)checkAutoExit {
    if (self.bAutoExit) {
        [self performSelector:@selector(releaseAdView)];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#ifdef __IPHONE_6_0

- (BOOL)shouldAutorotate{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#endif

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (UILabel *)label {
	return (UILabel *)[self.view viewWithTag:1006];
}

- (void)dealloc {
    self.requestNewAd = nil;
    self.rollOver = nil;
    [self releaseAdView];
}

#pragma mark Button handlers

- (void)releaseAdView {
    if (nAdViewCount < 1) return;
    
    --nAdViewCount;
    
	[AdViewController deleteController]; 
}

- (IBAction)requestNewAd:(id)sender {
	self.label.text = @"Request New Ad pressed! Requesting...";
    
    AdViewController *controller = [AdViewController sharedControllerIfExists];
    [controller requestNewAd];
}

- (IBAction)rollOver:(id)sender {
	self.label.text = @"Roll Over pressed! Requesting...";
    
    AdViewController *controller = [AdViewController sharedControllerIfExists];
    [controller rollOver];
}

- (void)showAdSizeLabel {
    UIButton *buttonAdSize =(UIButton*)[self.view viewWithTag:BUTTON_SIZE_TAG];
    
    NSString *lableStr = @"auto --> next";
    switch (gSimpAdSize) {
        case AdviewBannerSize_320x50:lableStr = @"320x50 -->next"; break;
        case AdviewBannerSize_300x250:lableStr = @"300x250 -->next"; break;
        case AdviewBannerSize_480x60:lableStr = @"480x60 -->next"; break;
        case AdviewBannerSize_728x90:lableStr = @"728x90 -->next"; break;
        default:
            break;
    }
    
    [buttonAdSize setTitle:lableStr forState:UIControlStateNormal];
}

- (IBAction)changeAdSize:(id)sender {
    int toAdSize = gSimpAdSize+1;
    if (toAdSize > AdviewBannerSize_728x90)
        toAdSize = AdviewBannerSize_Auto;
    
    gSimpAdSize = toAdSize;
    
    AdViewController *controller = [AdViewController sharedControllerIfExists];
    [controller setAdBannerSize:gSimpAdSize];
    [self showAdSizeLabel];
}

- (IBAction)testSwitch:(id)sender {
    if ([sender isKindOfClass:[UISwitch class]]) {
        simpleTool_Test = ((UISwitch*)sender).on;
        
        AdViewController *controller = [AdViewController sharedControllerIfExists];
        [controller setModeTest:simpleTool_Test Log:simpleTool_Log];
    }
}

#pragma mark AdViewControllerDelegate methods

- (void)didGotNotify:(NSString *)code Info:(NSString *)content
{
    if ([code isEqualToString:@"toGetAd"]
        || [code isEqualToString:@"adsAreOff"]) {
        [self performSelector:@selector(checkAutoExit) withObject:nil
                   afterDelay:self.autoExitDelay];
    }
    
    self.label.text = [NSString stringWithFormat:@"code:%@, info:%@", code, content];
}


@end
