import Flutter
import UIKit

public class SwiftBcBuglyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bc_app_bugly", binaryMessenger: registrar.messenger())
    let instance = SwiftBcBuglyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let values:Dictionary<String, Any> = call.arguments as? Dictionary<String, Any> ?? [:]
      if "initBugly" == call.method {
          let appId:String? =  values["appId"] as? String
          if (appId != nil && appId != "") {
              let channel:String? = (values["channel"] as? String);
              let buglyConfig =  BuglyConfig()
              if(channel != nil && channel != ""){
                  buglyConfig.channel = channel!
              }
              Bugly.start(withAppId:appId, config:buglyConfig)
              result(true)
          }else{
              result(false)
          }
      }else if "setUserId" == call.method{
          let userId:String? = values["userId"] as? String;
          if(userId != nil && userId != ""){
              Bugly.setUserIdentifier(userId!)
          }
          result(nil);
      }else if "setUserTag" == call.method{
          let userTag:Int? = values["userTag"] as? Int;
          if(userTag != nil){
              Bugly.setTag(UInt(userTag!))
          }
          result(nil);
      }else if "putUserData" == call.method{
          let key:String? = values["key"] as? String;
          let value:String? = values["value"] as? String;
          if(key != nil && key != "" && value != nil && value != ""){
              Bugly.setUserValue(value!, forKey:key!)
          }
          result(nil);
      }else if "postCaughtException" == call.method{
          let crash_detail:String? = values["crash_detail"] as? String;
          var crash_message:String? = values["crash_message"] as? String;
          if (crash_detail == nil) {
            crash_message = ""
          }
          let stackTraceArray:Array = crash_detail!.components(separatedBy:"");
          var data:Dictionary<String,Any>? = values["crash_data"] as? Dictionary;
          if(data == nil){
                data = [:];
           }
          Bugly.reportException(withCategory:5, name:crash_message!, reason:"", callStack:stackTraceArray, extraInfo:data!, terminateApp:false)
          result(nil);
      }
  }
}
