package com.example.bc_upgrade.appupdate.util

import android.util.Log
import com.example.bc_upgrade.appupdate.config.Constant

class LogUtil {

    companion object {
        var b = true

        fun enable(enable: Boolean) {
            b = enable
        }

        fun e(tag: String, msg: String) {
            if (b) Log.e(Constant.TAG + tag, msg)
        }

        fun d(tag: String, msg: String) {
            if (b) Log.d(Constant.TAG + tag, msg)
        }

        fun i(tag: String, msg: String) {
            if (b) Log.i(Constant.TAG + tag, msg)
        }

    }
}