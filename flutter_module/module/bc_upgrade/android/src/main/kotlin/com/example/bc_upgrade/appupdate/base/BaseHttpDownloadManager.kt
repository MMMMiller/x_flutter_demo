package com.example.bc_upgrade.appupdate.base

import com.example.bc_upgrade.appupdate.base.bean.DownloadStatus
import kotlinx.coroutines.flow.Flow
abstract class BaseHttpDownloadManager {
    /**
     * download apk from apkUrl
     *
     * @param apkUrl
     * @param apkName
     */
    abstract fun download(apkUrl: String, apkName: String): Flow<DownloadStatus>

    /**
     * cancel download apk
     */
    abstract fun cancel()

    /**
     * release memory
     */
    abstract fun release()
}