package com.pessaflow

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import android.util.Log
import java.lang.Exception

internal class AppSettingsManager {
    internal fun interface OpenAppSettingsSuccessCallback {
        fun onSuccess(appSettingsOpenedSuccessfully: Boolean)
    }

    fun openAppSettings(
            context: Context?,
            successCallback: OpenAppSettingsSuccessCallback,
            errorCallback: ErrorCallback
    ) {
        if (context == null) {
            Log.d(PermissionConstants.LOG_TAG, "Context cannot be null.")
            errorCallback.onError("PermissionHandler.AppSettingsManager", "Android context cannot be null.")
            return
        }
        try {
            val settingsIntent = Intent()
            settingsIntent.action = Settings.ACTION_APPLICATION_DETAILS_SETTINGS
            settingsIntent.addCategory(Intent.CATEGORY_DEFAULT)
            settingsIntent.data = Uri.parse("package:" + context.packageName)
            settingsIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            settingsIntent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
            settingsIntent.addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS)
            context.startActivity(settingsIntent)
            successCallback.onSuccess(true)
        } catch (ex: Exception) {
            successCallback.onSuccess(false)
        }
    }
}