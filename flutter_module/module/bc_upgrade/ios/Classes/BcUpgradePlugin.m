#import "BcUpgradePlugin.h"
#if __has_include(<bc_upgrade/bc_upgrade-Swift.h>)
#import <bc_upgrade/bc_upgrade-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bc_upgrade-Swift.h"
#endif

@implementation BcUpgradePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBcUpgradePlugin registerWithRegistrar:registrar];
}
@end
