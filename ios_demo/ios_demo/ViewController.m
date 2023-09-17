//
//  ViewController.m
//  ios_demo
//
//  Created by Miller on 2023/9/17.
//

#import "ViewController.h"
#import <flutter_thrio/FlutterThrio.h>
#import "MainModule.h"
#import "DemoVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *closeButton2 = [[UIButton alloc] initWithFrame: CGRectMake(150, 220, 150, 40) ];
    [closeButton2 setBackgroundColor:UIColor.blueColor];
    [closeButton2 setTitle:@"去Flutter" forState:UIControlStateNormal];
    
    [self.view addSubview:closeButton2];
    [closeButton2 addTarget:self action:@selector(closePage) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void )closePage {
//    UINavigationController *nvc = [[NavigatorNavigationController alloc] initWithUrl:@"/user/about_us" params:nil];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:DemoVC.new];
    [self presentViewController:nvc animated:YES completion:nil];
//    [self.navigationController thrio_pushUrl:@"/user/about_us" params:nil animated:YES fromEntrypoint:@"user" result:nil poppedResult:nil];
}


@end
