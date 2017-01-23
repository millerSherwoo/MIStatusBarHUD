//
//  ViewController.m
//  MIStatusBarHUDExample
//
//  Created by Miller_Sherwoo on 2017/1/23.
//  Copyright © 2017年 sostvcn. All rights reserved.
//

#import "ViewController.h"
#import "MIStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
	[MIStatusBarHUD showSuccess:@"加载成功"];
	
}
- (IBAction)error:(id)sender {
	[MIStatusBarHUD showError:@"加载失败,请重试!"];
}
- (IBAction)normal:(id)sender {
	[MIStatusBarHUD showMessage:@"检测到当前网络状态为数据网络"];
}

- (IBAction)loading:(id)sender {
	[MIStatusBarHUD showLoading:@"正在加载中..."];
}


- (IBAction)hide:(id)sender {
	[MIStatusBarHUD hide];
}

@end
