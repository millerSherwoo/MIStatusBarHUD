//
//  MIStatusBarHUD.h
//  MIStatusBarHUD
//
//  Created by Miller_Sherwoo on 2017/1/23.
//  Copyright © 2017年 sostvcn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIStatusBarHUD : NSObject

+ (void)showSuccess:(NSString *)message;
+ (void)showError:(NSString *)message;
+ (void)showMessage:(NSString *)message;
+ (void)showLoading:(NSString *)message;

+ (void)hide;

@end
