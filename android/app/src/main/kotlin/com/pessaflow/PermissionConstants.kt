package com.pessaflow

import androidx.annotation.IntDef

internal object PermissionConstants {
    const val LOG_TAG = "permissions_handler"
    const val PERMISSION_CODE = 24
    const val PERMISSION_CODE_IGNORE_BATTERY_OPTIMIZATIONS = 5672353

    //PERMISSION_GROUP
    const val PERMISSION_GROUP_CALENDAR = 0
    const val PERMISSION_GROUP_CAMERA = 1
    const val PERMISSION_GROUP_CONTACTS = 2
    const val PERMISSION_GROUP_LOCATION = 3
    const val PERMISSION_GROUP_LOCATION_ALWAYS = 4
    const val PERMISSION_GROUP_LOCATION_WHEN_IN_USE = 5
    const val PERMISSION_GROUP_MEDIA_LIBRARY = 6
    const val PERMISSION_GROUP_MICROPHONE = 7
    const val PERMISSION_GROUP_PHONE = 8
    const val PERMISSION_GROUP_PHOTOS = 9
    const val PERMISSION_GROUP_PHOTOS_ADD_ONLY = 10
    const val PERMISSION_GROUP_REMINDERS = 11
    const val PERMISSION_GROUP_SENSORS = 12
    const val PERMISSION_GROUP_SMS = 13
    const val PERMISSION_GROUP_SPEECH = 14
    const val PERMISSION_GROUP_STORAGE = 15
    const val PERMISSION_GROUP_IGNORE_BATTERY_OPTIMIZATIONS = 16
    const val PERMISSION_GROUP_NOTIFICATION = 17
    const val PERMISSION_GROUP_ACCESS_MEDIA_LOCATION = 18
    const val PERMISSION_GROUP_ACTIVITY_RECOGNITION = 19
    const val PERMISSION_GROUP_UNKNOWN = 20

    //PERMISSION_STATUS
    const val PERMISSION_STATUS_DENIED = 0
    const val PERMISSION_STATUS_GRANTED = 1
    const val PERMISSION_STATUS_RESTRICTED = 2
    const val PERMISSION_STATUS_NOT_DETERMINED = 3
    const val PERMISSION_STATUS_LIMITED = 4
    const val PERMISSION_STATUS_NEVER_ASK_AGAIN = 5

    //SERVICE_STATUS
    const val SERVICE_STATUS_DISABLED = 0
    const val SERVICE_STATUS_ENABLED = 1
    const val SERVICE_STATUS_NOT_APPLICABLE = 2

    @Retention(AnnotationRetention.SOURCE)
    @IntDef(
        PERMISSION_GROUP_CALENDAR,
        PERMISSION_GROUP_CAMERA,
        PERMISSION_GROUP_CONTACTS,
        PERMISSION_GROUP_LOCATION,
        PERMISSION_GROUP_LOCATION_ALWAYS,
        PERMISSION_GROUP_LOCATION_WHEN_IN_USE,
        PERMISSION_GROUP_MEDIA_LIBRARY,
        PERMISSION_GROUP_MICROPHONE,
        PERMISSION_GROUP_PHONE,
        PERMISSION_GROUP_PHOTOS,
        PERMISSION_GROUP_REMINDERS,
        PERMISSION_GROUP_SENSORS,
        PERMISSION_GROUP_SMS,
        PERMISSION_GROUP_SPEECH,
        PERMISSION_GROUP_STORAGE,
        PERMISSION_GROUP_IGNORE_BATTERY_OPTIMIZATIONS,
        PERMISSION_GROUP_NOTIFICATION,
        PERMISSION_GROUP_ACCESS_MEDIA_LOCATION,
        PERMISSION_GROUP_ACTIVITY_RECOGNITION,
        PERMISSION_GROUP_UNKNOWN
    )
    internal annotation class PermissionGroup

    @Retention(AnnotationRetention.SOURCE)
    @IntDef(
        PERMISSION_STATUS_DENIED,
        PERMISSION_STATUS_GRANTED,
        PERMISSION_STATUS_RESTRICTED,
        PERMISSION_STATUS_NOT_DETERMINED,
        PERMISSION_STATUS_LIMITED,
        PERMISSION_STATUS_NEVER_ASK_AGAIN
    )
    internal annotation class PermissionStatus

    @Retention(AnnotationRetention.SOURCE)
    @IntDef(SERVICE_STATUS_DISABLED, SERVICE_STATUS_ENABLED, SERVICE_STATUS_NOT_APPLICABLE)
    internal annotation class ServiceStatus
}