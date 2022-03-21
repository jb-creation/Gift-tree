package com.pessaflow
internal fun interface ErrorCallback {
    fun onError(errorCode: String?, errorDescription: String?)
}