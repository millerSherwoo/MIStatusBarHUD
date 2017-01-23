 //
//  MIStatusBarHUD.m
//  MIStatusBarHUD
//
//  Created by Miller_Sherwoo on 2017/1/23.
//  Copyright © 2017年 sostvcn. All rights reserved.
//

#import "MIStatusBarHUD.h"

@implementation MIStatusBarHUD

static UIWindow * window_;
static NSTimer * timer_;
static CGFloat const HUDHeight = 40;
static double const duration = 3.0;

#define MIScreenWidth [UIScreen mainScreen].bounds.size.width
#define MIHUDSuccessBGColor [UIColor colorWithRed:0.33 green:0.84 blue:0.41 alpha:1.00]
#define MIHUDErrorBGColor [UIColor colorWithRed:0.99 green:0.30 blue:0.28 alpha:1.00]
#define MIHUDNormalBGColor [UIColor colorWithRed:0.18 green:0.67 blue:0.99 alpha:1.00]
#define MIMessageFont [UIFont systemFontOfSize:14]

+ (void)showWindow {
	window_ = [[UIWindow alloc] init];
	window_.hidden = YES;
	window_.frame = CGRectMake(0, -HUDHeight, MIScreenWidth, HUDHeight);
	window_.backgroundColor = MIHUDNormalBGColor;
	window_.hidden = NO;
	window_.windowLevel = UIWindowLevelStatusBar;
	window_.layer.shadowOpacity = 0.8;
	window_.layer.shadowOffset = CGSizeMake(0, 1);
	window_.layer.shadowColor = [UIColor lightGrayColor].CGColor;
	
	[UIView animateWithDuration:0.5 animations:^{
		CGRect frame = window_.frame;
		frame.origin.y = 0;
		window_.frame = frame;
	}];
	
}

+ (void)setupLabelWithMessage:(NSString *)message {
	UILabel *label = [[UILabel alloc] initWithFrame:window_.bounds];
	label.text = message;
	label.textAlignment = NSTextAlignmentCenter;
	label.font = MIMessageFont;
	label.textColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
	label.numberOfLines = 0;
	[window_ addSubview:label];
}
+ (void)showMessage:(NSString *)message hideAfter:(NSTimeInterval)time {
	
}

+ (void)showSuccess:(NSString *)message {
	
	[self showWindow];
	[self setupLabelWithMessage:message];
	window_.backgroundColor = MIHUDSuccessBGColor;
	
	[timer_ invalidate];
	timer_ = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(hide) userInfo:nil repeats:NO];
	
}

+ (void)showError:(NSString *)message {
	[self showWindow];
	[self setupLabelWithMessage:message];
	window_.backgroundColor = MIHUDErrorBGColor;
	
	[timer_ invalidate];
	timer_ = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showMessage:(NSString *)message {
	[self showWindow];
	[self setupLabelWithMessage:message];
	window_.backgroundColor = MIHUDNormalBGColor;
	
	[timer_ invalidate];
	timer_ = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showLoading:(NSString *)message {
	[timer_ invalidate];
	timer_ = nil;
	
	[self showWindow];
	[self setupLabelWithMessage:message];
	window_.backgroundColor = MIHUDNormalBGColor;
	UIActivityIndicatorView *loadvingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[loadvingView startAnimating];
	CGFloat messageW = [message sizeWithAttributes:@{NSFontAttributeName:MIMessageFont}].width;
	loadvingView.center = CGPointMake((window_.frame.size.width - messageW) * 0.5 - 20, HUDHeight * 0.5);
	[window_ addSubview:loadvingView];
}


+ (void)hide {
	timer_ = nil;
	[UIView animateWithDuration:0.5 animations:^{
		CGRect frame = window_.frame;
		frame.origin.y = -HUDHeight;
		window_.frame = frame;
	} completion:^(BOOL finished) {
		window_ = nil;
	}];
}

@end
