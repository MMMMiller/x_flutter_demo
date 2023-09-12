//
//  ViewController.m
//  FlutterBoostPro
//
//  Created by Miller on 2023/6/10.
//

#import "ViewController.h"
#import "NativeViewController.h"
#import "FlutterModuleAgent.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"原生页面";
    
    var flutterPresentButton = [UIButton jk_buttonWithFrame:CGRectMake(0, 460, 150, 40) titleColor:UIColor.whiteColor title:@"跳Flutter【Present】"];
    flutterPresentButton.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:flutterPresentButton];
    flutterPresentButton.jk_centerX = self.view.jk_centerX;
    [flutterPresentButton addTarget:self action:@selector(presentSearchPage) forControlEvents:(UIControlEventTouchUpInside)];
    
    var flutterButton = [UIButton jk_buttonWithFrame:CGRectMake(0, 380, 150, 40) titleColor:UIColor.whiteColor title:@"跳Flutter【Push】"];
    flutterButton.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:flutterButton];
    flutterButton.jk_centerX = self.view.jk_centerX;
    [flutterButton addTarget:self action:@selector(pushSearchPage) forControlEvents:(UIControlEventTouchUpInside)];
    
    var nativeButton = [UIButton jk_buttonWithFrame:CGRectMake(0, 300, 150, 40) titleColor:UIColor.whiteColor title:@"跳原生"];
    nativeButton.jk_centerX = self.view.jk_centerX;
    nativeButton.x_font(PingFangMediumFont(15)).jk_backgroundColor(UIColor.purpleColor).jk_cornrRadius(4);
    [self.view addSubview:nativeButton];
    [nativeButton addTarget:self action:@selector(pushNativePage) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}


- (void)presentSearchPage {
    self.index ++;
    [FlutterModuleNavigator present:@"main/search_page" arguments:@{@"index":@(self.index)}];
}

- (void)pushSearchPage {
    self.index ++;
    [FlutterModuleNavigator push:@"/" arguments:@{@"index":@(self.index)}];
}

- (void)pushNativePage {
    var vc = [[NativeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}


- (void)setSystemMode API_AVAILABLE(ios(13.0), tvos(13.0)) {
    self.view.window.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    [FlutterModuleAgent.shared preloadFlutterModuleAfterDelay:0.5];
}

- (void)setDarkMode API_AVAILABLE(ios(13.0), tvos(13.0)) {
    self.view.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    [FlutterModuleAgent.shared preloadFlutterModuleAfterDelay:0.5];
}

- (void)setLightMode API_AVAILABLE(ios(13.0), tvos(13.0)) {
    self.view.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    [FlutterModuleAgent.shared preloadFlutterModuleAfterDelay:0.5];
}



@end
