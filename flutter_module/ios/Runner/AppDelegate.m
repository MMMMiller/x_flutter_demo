#import "AppDelegate.h"
#import <flutter_thrio/FlutterThrio.h>
#import <Flutter/Flutter.h>
#import "NativeViewController.h"
#import "MainModule.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ThrioModule init:[MainModule new] preboot:YES];
    UINavigationController *nnvc = [[UINavigationController alloc] initWithRootViewController:NativeViewController.new];
//    UINavigationController *nvc = [[NavigatorNavigationController alloc] initWithUrl:@"/user/about_us" params:nil];
    self.window.rootViewController = nnvc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

