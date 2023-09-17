#import "AppDelegate.h"
#import <flutter_thrio/FlutterThrio.h>
#import <Flutter/Flutter.h>

#import "MainModule.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ThrioModule init:[MainModule new] preboot:NO];
//    UINavigationController *nvc = [[NavigatorNavigationController alloc] initWithUrl:@"/user/about_us" params:nil];
    UIViewController *avc = UIViewController.new;
    avc.view.backgroundColor = UIColor.redColor;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:avc];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

