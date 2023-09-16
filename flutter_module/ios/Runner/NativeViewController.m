//
//  NativeViewController.m
//  Runner
//
//  Created by Miller on 2023/9/16.
//

#import "NativeViewController.h"
#import <flutter_thrio/FlutterThrio.h>
#import <Flutter/Flutter.h>
#import "NativeViewController.h"
#import "MainModule.h"

@interface NativeViewController ()

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UINavigationController *nvc = [[NavigatorNavigationController alloc] initWithUrl:@"/user/about_us" params:nil];
    [self.navigationController presentViewController:nvc animated:YES completion:^{
        
    }];
//    [ThrioNavigator pushUrl:@"/user/about_us"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
