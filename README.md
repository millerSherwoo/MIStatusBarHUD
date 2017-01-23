# MIStatusBarHUD
一个易用,轻量的的状态栏指示器框架  
A easy and lighting framework to show message on the status bar  
动画展示并隐藏hud,通过不同颜色展示不同状态,可自定义颜色  
show and hide HUD animated,different colors to present different status, and color customized
- 01-显示成功信息  
01-show success message
- 02-显示错误信息  
02-show error message
- 03-显示常用信息  
03-show normal message
- 04-显示加载图标并文字  
04-show loading message
- 05-隐藏HUD  
05-hide hud

## 显示成功信息 - Show success message
```objc
[MIStatusBarHUD showSuccess:@"success Message"];
```
![image](https://github.com/millerSherwoo/MIStatusBarHUD/blob/master/images/success_sd.png)
## 显示错误信息 - Show error message
```objc
[MIStatusBarHUD showError:@"error Mesaage"];
```
![image](https://github.com/millerSherwoo/MIStatusBarHUD/blob/master/images/error.png)
## 显示普通信息 - Show normal message
```objc
[MIStatusBarHUD showMessage:@"normal Mesaage"];
```
![image](https://github.com/millerSherwoo/MIStatusBarHUD/blob/master/images/normal.png)
## 显示正在加载信息 - Show loading message
```objc
[MIStatusBarHUD showLoading:@"loading..."];
```
![image](https://github.com/millerSherwoo/MIStatusBarHUD/blob/master/images/loading.png)
## 隐藏HUD - hide HUD
```objc
[MIStatusBarHUD hide];
```
