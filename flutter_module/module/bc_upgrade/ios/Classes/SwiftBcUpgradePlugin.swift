import Flutter
import UIKit

public class SwiftBcUpgradePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bc_app_upgrade", binaryMessenger: registrar.messenger())
    let instance = SwiftBcUpgradePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "getVersionCode"){
          let versionCode:String  = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
          result(Int(versionCode));
          } else if(call.method == "getVersionName"){
              let versionName:String  = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
              result(versionName);
          }else if(call.method == "update"){
              self.update(call.arguments as? Dictionary<String, Any> ?? [:]);
          }else if(call.method == "cancel"){
              NSLog("取消下载");
          }
  }

 
    func update(_ arguments:Dictionary<String, Any>){
        let model:Dictionary = arguments["model"] as! Dictionary<String,Any?>;
        let apkDescription:String = model["apkDescription"] as! String;
        let iOSUrl:String = model["iOSUrl"] as! String;
        let showiOSDialog:Bool = model["showiOSDialog"] as! Bool;
        let forcedUpgrade:Bool = model["forcedUpgrade"] as! Bool;
        //不显示对话框，直接打开appStore
        if (!showiOSDialog) {
            self.openAppStore(iOSUrl);
            return;
        }
        
        let alert:UIAlertController = UIAlertController(title:"发现新版本", message: apkDescription, preferredStyle:.alert)
        
        if (forcedUpgrade) {
            alert.notDismiss = true;
        }
        
        let conform:UIAlertAction = UIAlertAction(title:"升级", style:.default) { UIAlertAction in
            self.openAppStore(iOSUrl)
        }
        
        //强制更新
        if (!forcedUpgrade) {
            let cancel:UIAlertAction = UIAlertAction(title:"取消", style:.default) { UIAlertAction in
                NSLog("点击取消");
            }
            alert.addAction(cancel);
        }
        alert.addAction(conform);
        
        self.findViewController(nil).present(alert, animated:true)
//        [[self findViewController:nil] presentViewController:alert animated:YES completion:nil];
    }
   
    
    func openAppStore(_ iOSUrl:String){
//        NSString *url = [iOSUrl stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@""] invertedSet]];
//        NSLog(@"打开iOS下载地址：%@",url);
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        if let url = URL(string: iOSUrl) {
                    UIApplication.shared.openURL(url)
                }
    }

    func findViewController(_ window:UIWindow?) -> UIViewController {
        var windowToUse:UIWindow? = window;
        if (windowToUse == nil) {
            for window in UIApplication.shared.windows {
                if (window.isKeyWindow) {
                    windowToUse = window;
                    break;
                }
            }
        }
        var topController:UIViewController = windowToUse!.rootViewController!
        while ((topController.presentedViewController) != nil) {
            topController = topController.presentedViewController!;
        }
        return topController;
    }
    
    
}
