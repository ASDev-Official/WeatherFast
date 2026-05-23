package com.aadishsamir.weatherfast

import android.content.Context

data class WeatherWidgetSettings(
    val hourlyCards: Int?,
    val dailyCards: Int?,
    val isTransparent: Boolean,
    val isTextBlack: Boolean,
    val customThemeColor: String?,
    val fontScale: Float,
)

object WeatherWidgetConfigStore {
    private const val PREFS_NAME = "WeatherWidgetConfig"
    private const val KEY_HOURLY_PREFIX = "hourly_"
    private const val KEY_DAILY_PREFIX = "daily_"
    private const val KEY_TRANSPARENT_PREFIX = "transparent_"
    private const val KEY_TEXT_BLACK_PREFIX = "text_black_"
    private const val KEY_CUSTOM_COLOR_PREFIX = "custom_color_"
    private const val KEY_FONT_SCALE_PREFIX = "font_scale_"

    fun load(context: Context, widgetId: Int): WeatherWidgetSettings {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val hourlyRaw = prefs.getInt("$KEY_HOURLY_PREFIX$widgetId", -1)
        val dailyRaw = prefs.getInt("$KEY_DAILY_PREFIX$widgetId", -1)
        val isTransparent = prefs.getBoolean("$KEY_TRANSPARENT_PREFIX$widgetId", false)
        val isTextBlack = prefs.getBoolean("$KEY_TEXT_BLACK_PREFIX$widgetId", false)
        val customThemeColor = prefs.getString("$KEY_CUSTOM_COLOR_PREFIX$widgetId", null)
        val fontScale = prefs.getFloat("$KEY_FONT_SCALE_PREFIX$widgetId", 1.0f)

        return WeatherWidgetSettings(
            hourlyCards = hourlyRaw.takeIf { it >= 0 },
            dailyCards = dailyRaw.takeIf { it >= 0 },
            isTransparent = isTransparent,
            isTextBlack = isTextBlack,
            customThemeColor = customThemeColor,
            fontScale = fontScale,
        )
    }

    fun save(context: Context, widgetId: Int, hourlyCards: Int, dailyCards: Int, isTransparent: Boolean, isTextBlack: Boolean, customThemeColor: String?, fontScale: Float) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit()
            .putInt("$KEY_HOURLY_PREFIX$widgetId", hourlyCards)
            .putInt("$KEY_DAILY_PREFIX$widgetId", dailyCards)
            .putBoolean("$KEY_TRANSPARENT_PREFIX$widgetId", isTransparent)
            .putBoolean("$KEY_TEXT_BLACK_PREFIX$widgetId", isTextBlack)
            .putString("$KEY_CUSTOM_COLOR_PREFIX$widgetId", customThemeColor)
            .putFloat("$KEY_FONT_SCALE_PREFIX$widgetId", fontScale)
            .apply()
    }
}
