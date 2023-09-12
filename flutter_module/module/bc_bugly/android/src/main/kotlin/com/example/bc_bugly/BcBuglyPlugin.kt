package com.example.bc_bugly

import android.content.Context
import android.text.TextUtils
import androidx.annotation.NonNull
import com.tencent.bugly.crashreport.CrashReport
import io.flutter.BuildConfig
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BcBuglyPlugin */
class BcBuglyPlugin: FlutterPlugin, MethodCallHandler{
  private lateinit var channel : MethodChannel
  private lateinit var applicationContext: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bc_app_bugly")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "initBugly") {
      if (call.hasArgument("appId")) {
        val appId = call.argument<Any>("appId").toString()
        CrashReport.initCrashReport(applicationContext,appId,BuildConfig.DEBUG)
        if (call.hasArgument("channel")) {
          val channel = call.argument<String>("channel")
          if (!TextUtils.isEmpty(channel)) CrashReport.setAppChannel(
            applicationContext,
            channel
          )
        }
        result.success(true)
      } else {
        result.success(false)
      }
    } else if (call.method == "setUserTag") {
      if (call.hasArgument("userTag")) {
        val userTag = call.argument<Int>("userTag")
        if (userTag != null) CrashReport.setUserSceneTag(
          applicationContext,
          userTag
        )
      }
      result.success(null)
    } else if (call.method == "putUserData") {
      if (call.hasArgument("key") && call.hasArgument("value")) {
        val userDataKey = call.argument<String>("key")
        val userDataValue = call.argument<String>("value")
        CrashReport.putUserData(
          applicationContext,
          userDataKey,
          userDataValue
        )
      }
      result.success(null)
    } else if (call.method == "postCaughtException") {
      postException(call)
      result.success(null)
    }
  }

  private fun postException(call: MethodCall) {
    var message: String? = ""
    var detail: String? = null
    if (call.hasArgument("crash_message")) {
      message = call.argument("crash_message")
    }
    if (call.hasArgument("crash_detail")) {
      detail = call.argument("crash_detail")
    }
    if (TextUtils.isEmpty(detail)) return
    CrashReport.postException(8, "Flutter Exception", message, detail, null)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
