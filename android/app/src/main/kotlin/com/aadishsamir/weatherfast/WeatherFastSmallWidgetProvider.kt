package com.aadishsamir.weatherfast

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.app.PendingIntent
import android.appwidget.AppWidgetProvider
import android.widget.RemoteViews

class WeatherFastSmallWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val widgetData = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE)
        appWidgetIds.forEach { widgetId ->
            updateSmallWidget(context, appWidgetManager, widgetId, widgetData)
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        if (intent.action == "com.aadishsamir.weatherfast.WIDGET_REFRESH") {
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val widgetId = intent.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, 0)
            if (widgetId != 0) {
                // Show progress
                val views = RemoteViews(context.packageName, R.layout.weather_widget_small_host)
                views.setDisplayedChild(R.id.widget_refresh_flipper_sg, 1)
                appWidgetManager.updateAppWidget(widgetId, views)

                try {
                    val bgIntent = Intent()
                    bgIntent.setClassName(context, "es.antonborri.home_widget.HomeWidgetBackgroundReceiver")
                    bgIntent.data = android.net.Uri.parse("weatherfast://refresh")
                    val pendingIntent = PendingIntent.getBroadcast(
                        context, 0, bgIntent,
                        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                    )
                    pendingIntent.send()
                } catch (_: Exception) {}
            }
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: android.os.Bundle,
    ) {
        val prefs = context.getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE)
        updateSmallWidget(context, appWidgetManager, appWidgetId, prefs)
    }

    private fun updateSmallWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        widgetId: Int,
        widgetData: SharedPreferences,
    ) {
        val views = RemoteViews(context.packageName, R.layout.weather_widget_small_host)
        val widgetSettings = WeatherWidgetConfigStore.load(context, widgetId)

        // Bind data
        val city = widgetData.getString("wf_location_name", "WeatherFast") ?: "WeatherFast"
        
        // Ensure degree symbol and correct formatting for temp
        val temp = widgetData.getString("wf_temperature", "--") ?: "--"
        val formattedTemp: CharSequence = run {
            var normalized = temp.trim()
            if (normalized.endsWith(" C", ignoreCase = true)) {
                normalized = normalized.dropLast(2).trim() + "°C"
            } else if (normalized.endsWith(" F", ignoreCase = true)) {
                normalized = normalized.dropLast(2).trim() + "°F"
            } else if (!normalized.contains("°") && (normalized.endsWith("C", ignoreCase = true) || normalized.endsWith("F", ignoreCase = true))) {
                normalized = normalized.dropLast(1).trim() + "°" + normalized.takeLast(1).uppercase()
            }
            
            if (normalized.contains("°")) {
                val parts = normalized.split("°", limit = 2)
                val num = parts[0].trim()
                val unit = if (parts.size > 1) parts[1].trim() else ""
                
                val builder = android.text.SpannableStringBuilder(num)
                val start = builder.length
                builder.append("°").append(unit)
                builder.setSpan(android.text.style.SuperscriptSpan(), start, builder.length, android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
                builder.setSpan(android.text.style.RelativeSizeSpan(0.6f), start, builder.length, android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
                builder
            } else {
                temp
            }
        }

        val condition = widgetData.getString("wf_condition_text", "Open app to set location") ?: "Open app to set location"
        val glyph = widgetData.getString("wf_condition_glyph", "partly") ?: "partly"
        val highLow = widgetData.getString("wf_high_low", "-- / --") ?: "-- / --"
        val lastRefresh = widgetData.getString("wf_last_refresh", "--") ?: "--"

        views.setTextViewText(R.id.widget_location_sg, city)
        views.setTextViewText(R.id.widget_temp_sg, formattedTemp)
        views.setTextViewText(R.id.widget_condition_sg, condition)
        views.setTextViewText(R.id.widget_high_low_sg, highLow)
        views.setTextViewText(R.id.widget_last_refresh_sg, lastRefresh)
        views.setImageViewResource(R.id.widget_condition_icon_sg, iconResForToken(glyph))

        // Reset flipper to normal icon
        views.setDisplayedChild(R.id.widget_refresh_flipper_sg, 0)

        // Apply appearance settings
        val isTransparent = widgetSettings.isTransparent
        val isTextBlack = widgetSettings.isTextBlack
        val fontScale = widgetSettings.fontScale
        val sgScale = widgetSettings.sgLeftFontScale

        if (isTransparent) {
            views.setInt(R.id.widget_root, "setBackgroundColor", android.graphics.Color.TRANSPARENT)
        } else {
            views.setInt(R.id.widget_root, "setBackgroundResource", R.drawable.weather_widget_gradient_background)
        }

        // Apply font scaling exact to SG base
        views.setTextViewTextSize(R.id.widget_location_sg, android.util.TypedValue.COMPLEX_UNIT_SP, 14f * sgScale * fontScale)
        views.setTextViewTextSize(R.id.widget_condition_sg, android.util.TypedValue.COMPLEX_UNIT_SP, 12f * sgScale * fontScale)
        views.setTextViewTextSize(R.id.widget_temp_sg, android.util.TypedValue.COMPLEX_UNIT_SP, 28f * sgScale * fontScale)
        views.setTextViewTextSize(R.id.widget_high_low_sg, android.util.TypedValue.COMPLEX_UNIT_SP, 11f * sgScale * fontScale)
        views.setTextViewTextSize(R.id.widget_last_refresh_sg, android.util.TypedValue.COMPLEX_UNIT_SP, 9f * sgScale * fontScale)

        var brightColor: Int
        var dimColor: Int
        if (isTransparent && !widgetSettings.customThemeColor.isNullOrBlank()) {
            try {
                var colorStr = widgetSettings.customThemeColor
                if (!colorStr.startsWith("#")) colorStr = "#$colorStr"
                val parsed = android.graphics.Color.parseColor(colorStr)
                brightColor = parsed
                dimColor = android.graphics.Color.argb(
                    200,
                    android.graphics.Color.red(parsed),
                    android.graphics.Color.green(parsed),
                    android.graphics.Color.blue(parsed),
                )
            } catch (_: Exception) {
                brightColor = if (isTextBlack) android.graphics.Color.BLACK else android.graphics.Color.parseColor("#F4FAFF")
                dimColor = if (isTextBlack) android.graphics.Color.parseColor("#444444") else android.graphics.Color.parseColor("#CADAEA")
            }
        } else {
            brightColor = if (isTextBlack) android.graphics.Color.BLACK else android.graphics.Color.parseColor("#F4FAFF")
            dimColor = if (isTextBlack) android.graphics.Color.parseColor("#444444") else android.graphics.Color.parseColor("#CADAEA")
        }

        views.setTextColor(R.id.widget_location_sg, brightColor)
        views.setTextColor(R.id.widget_temp_sg, brightColor)
        views.setTextColor(R.id.widget_condition_sg, dimColor)
        views.setTextColor(R.id.widget_high_low_sg, dimColor)
        views.setTextColor(R.id.widget_last_refresh_sg, dimColor)
        views.setInt(R.id.widget_refresh_icon_sg, "setColorFilter", dimColor)
        views.setInt(R.id.widget_location_icon_sg, "setColorFilter", dimColor)

        // Click listeners
        views.setOnClickPendingIntent(
            R.id.widget_root,
            WeatherWidgetCommon.openAppIntent(context, 1000 + widgetId),
        )

        val refreshIntent = Intent(context, this::class.java).apply {
            action = "com.aadishsamir.weatherfast.WIDGET_REFRESH"
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId)
        }
        val refreshPending = PendingIntent.getBroadcast(
            context,
            widgetId,
            refreshIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
        views.setOnClickPendingIntent(R.id.widget_refresh_container_sg, refreshPending)

        appWidgetManager.updateAppWidget(widgetId, views)
    }

    private fun iconResForToken(token: String): Int {
        return when (token.lowercase()) {
            "clear", "sun", "sunny" -> R.drawable.ic_wf_sun
            "cloud", "cloudy", "overcast" -> R.drawable.ic_wf_cloud
            "rain", "drizzle", "shower" -> R.drawable.ic_wf_rain
            "snow", "sleet", "ice" -> R.drawable.ic_wf_snow
            "storm", "thunder" -> R.drawable.ic_wf_storm
            "fog", "mist", "haze" -> R.drawable.ic_wf_fog
            else -> R.drawable.ic_wf_partly
        }
    }
}