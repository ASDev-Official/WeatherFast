package com.aadishsamir.weatherfast

import android.content.Context

data class WeatherWidgetSettings(
    val hourlyCards: Int?,
    val dailyCards: Int?,
)

object WeatherWidgetConfigStore {
    private const val PREFS_NAME = "WeatherWidgetConfig"
    private const val KEY_HOURLY_PREFIX = "hourly_"
    private const val KEY_DAILY_PREFIX = "daily_"

    fun load(context: Context, widgetId: Int): WeatherWidgetSettings {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val hourlyRaw = prefs.getInt("$KEY_HOURLY_PREFIX$widgetId", -1)
        val dailyRaw = prefs.getInt("$KEY_DAILY_PREFIX$widgetId", -1)

        return WeatherWidgetSettings(
            hourlyCards = hourlyRaw.takeIf { it >= 0 },
            dailyCards = dailyRaw.takeIf { it >= 0 },
        )
    }

    fun save(context: Context, widgetId: Int, hourlyCards: Int, dailyCards: Int) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit()
            .putInt("$KEY_HOURLY_PREFIX$widgetId", hourlyCards)
            .putInt("$KEY_DAILY_PREFIX$widgetId", dailyCards)
            .apply()
    }
}
