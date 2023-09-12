#import "BcBuglyPlugin.h"
#if __has_include(<bc_bugly/bc_bugly-Swift.h>)
#import <bc_bugly/bc_bugly-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bc_bugly-Swift.h"
#endif

@implementation BcBuglyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBcBuglyPlugin registerWithRegistrar:registrar];
}
@end
