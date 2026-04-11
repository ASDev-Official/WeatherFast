package com.aadishsamir.weatherfast

import android.app.PendingIntent
import android.content.Context
import android.content.Intent

object WeatherWidgetCommon {
    fun openAppIntent(context: Context, requestCode: Int): PendingIntent {
        val intent = Intent(context, MainActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP

        return PendingIntent.getActivity(
            context,
            requestCode,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    fun updatedLabel(value: String): String {
        if (value.isEmpty()) {
            return "Updated just now"
        }

        return if (value.length >= 16) {
            val hhmm = value.substring(11, 16)
            "Updated $hhmm"
        } else {
            "Updated"
        }
    }
}
