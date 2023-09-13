//
//  NativeViewController.m
//  FlutterBoostPro
//
//  Created by Miller on 2023/6/10.
//

#import "NativeViewController.h"
#import "FlutterModuleAgent.h"
#import <Masonry/Masonry.h>

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"原生页面2";
    
    var nativeButton = [UIButton jk_buttonWithFrame:CGRectMake(0, 0, 150, 40) titleColor:UIColor.whiteColor title:@"跳转原生页面"];
    nativeButton.center = self.view.center;
    nativeButton.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:nativeButton];
    [nativeButton addTarget:self action:@selector(pushNativePage) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    var flutterButton2 = [UIButton jk_buttonWithFrame:CGRectMake(0, 0, 150, 40) titleColor:UIColor.whiteColor title:@"跳转Flutter页面"];
    flutterButton2.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:flutterButton2];
    [flutterButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).mas_offset(80);
    }];
    [flutterButton2 addTarget:self action:@selector(pushSearchPage) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    var closeButton2 = [UIButton jk_buttonWithFrame:CGRectMake(0, 0, 150, 40) titleColor:UIColor.whiteColor title:@"回首页"];
    closeButton2.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:closeButton2];
    [closeButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).mas_offset(160);
    }];
    [closeButton2 addTarget:self action:@selector(closePage) forControlEvents:(UIControlEventTouchUpInside)];
}


- (void)pushNativePage {
    var vc = [[NativeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}


- (void)pushSearchPage {
    [FlutterModuleNavigator push:@"main/cms_page" arguments:@{@"index":@(22222)}];
    
}

- (void)closePage {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
