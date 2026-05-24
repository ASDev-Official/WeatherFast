package com.aadishsamir.weatherfast

import android.app.Activity
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.content.Context
import android.widget.Button
import android.widget.NumberPicker
import android.widget.SeekBar
import android.widget.TextView

class WeatherWidgetConfigureActivity : Activity() {
    private var appWidgetId = AppWidgetManager.INVALID_APPWIDGET_ID

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setResult(RESULT_CANCELED)

        appWidgetId = intent?.extras?.getInt(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        ) ?: AppWidgetManager.INVALID_APPWIDGET_ID

        if (appWidgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            finish()
            return
        }

        setContentView(R.layout.activity_weather_widget_configure)

        val appWidgetManager = AppWidgetManager.getInstance(this)
        val providerInfo = appWidgetManager.getAppWidgetInfo(appWidgetId)
        val widgetFamily = resolveWidgetFamily(providerInfo?.provider)

        val titleView = findViewById<TextView>(R.id.widget_config_title)
        val hourlyPicker = findViewById<NumberPicker>(R.id.widget_config_hourly_picker)
        val dailySection = findViewById<View>(R.id.widget_config_daily_section)
        val dailyPicker = findViewById<NumberPicker>(R.id.widget_config_daily_picker)
        val transparentSwitch = findViewById<android.widget.Switch>(R.id.widget_config_transparent_switch)
        val colorGroup = findViewById<android.widget.RadioGroup>(R.id.widget_config_text_color_group)
        val colorWhite = findViewById<android.widget.RadioButton>(R.id.widget_config_text_white)
        val colorBlack = findViewById<android.widget.RadioButton>(R.id.widget_config_text_black)
        val customColorSection = findViewById<View>(R.id.widget_config_custom_color_section)
        val customColorInput = findViewById<android.widget.EditText>(R.id.widget_config_custom_color_input)
        val cancelButton = findViewById<Button>(R.id.widget_config_cancel)
        val saveButton = findViewById<Button>(R.id.widget_config_save)
        val fontScaleSeek = findViewById<SeekBar>(R.id.widget_config_font_scale_seek)
        val fontScaleLabel = findViewById<TextView>(R.id.widget_config_font_scale_label)
        val sgScaleSection = findViewById<View>(R.id.widget_config_sg_scale_section)
        val sgScaleSeek = findViewById<SeekBar>(R.id.widget_config_sg_scale_seek)
        val sgScaleLabel = findViewById<TextView>(R.id.widget_config_sg_scale_label)
        val topScaleSection = findViewById<View>(R.id.widget_config_top_scale_section)
        val topScaleSeek = findViewById<SeekBar>(R.id.widget_config_top_scale_seek)
        val topScaleLabel = findViewById<TextView>(R.id.widget_config_top_scale_label)
        val topScaleTitle = findViewById<TextView>(R.id.widget_config_top_scale_title)
        val bottomScaleSection = findViewById<View>(R.id.widget_config_bottom_scale_section)
        val bottomScaleSeek = findViewById<SeekBar>(R.id.widget_config_bottom_scale_seek)
        val bottomScaleLabel = findViewById<TextView>(R.id.widget_config_bottom_scale_label)


        // SeekBar: 30 steps → 0.5 to 2.0 in 0.05 increments. Default progress 10 = 1.0x
        fun progressToScale(p: Int) = 0.5f + p * 0.05f
        fun scaleToProgress(s: Float) = ((s - 0.5f) / 0.05f).toInt().coerceIn(0, 30)

        val existing = WeatherWidgetConfigStore.load(this, appWidgetId)

        fontScaleSeek.progress = scaleToProgress(existing.fontScale)
        fontScaleLabel.text = "Scale: ${"%,.1f".format(existing.fontScale)}x"
        fontScaleSeek.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seek: SeekBar?, progress: Int, fromUser: Boolean) {
                val scale = progressToScale(progress)
                fontScaleLabel.text = "Scale: ${"%,.1f".format(scale)}x"
            }
            override fun onStartTrackingTouch(seek: SeekBar?) {}
            override fun onStopTrackingTouch(seek: SeekBar?) {}
        })

        sgScaleSeek.progress = scaleToProgress(existing.sgLeftFontScale)
        sgScaleLabel.text = "Scale: ${"%,.1f".format(existing.sgLeftFontScale)}x"
        sgScaleSeek.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seek: SeekBar?, progress: Int, fromUser: Boolean) {
                val scale = progressToScale(progress)
                sgScaleLabel.text = "Scale: ${"%,.1f".format(scale)}x"
            }
            override fun onStartTrackingTouch(seek: SeekBar?) {}
            override fun onStopTrackingTouch(seek: SeekBar?) {}
        })

        topScaleSeek.progress = scaleToProgress(existing.topFontScale)
        topScaleLabel.text = "Scale: ${"%,.1f".format(existing.topFontScale)}x"
        topScaleSeek.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seek: SeekBar?, progress: Int, fromUser: Boolean) {
                topScaleLabel.text = "Scale: ${"%,.1f".format(progressToScale(progress))}x"
            }
            override fun onStartTrackingTouch(seek: SeekBar?) {}
            override fun onStopTrackingTouch(seek: SeekBar?) {}
        })

        bottomScaleSeek.progress = scaleToProgress(existing.bottomFontScale)
        bottomScaleLabel.text = "Scale: ${"%,.1f".format(existing.bottomFontScale)}x"
        bottomScaleSeek.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seek: SeekBar?, progress: Int, fromUser: Boolean) {
                bottomScaleLabel.text = "Scale: ${"%,.1f".format(progressToScale(progress))}x"
            }
            override fun onStartTrackingTouch(seek: SeekBar?) {}
            override fun onStopTrackingTouch(seek: SeekBar?) {}
        })


        val flutterPrefs = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val flutterIsSg = flutterPrefs.getBoolean("flutter.is_singapore", false)
        
        val homeWidgetPrefs = getSharedPreferences("HomeWidgetPreferences", Context.MODE_PRIVATE)
        val widgetIsSg = homeWidgetPrefs.getBoolean("wf_is_singapore", false)
        
        val isSingapore = flutterIsSg || widgetIsSg

        val mainScaleTitle = findViewById<TextView>(R.id.widget_config_main_scale_title)

        if (widgetFamily == "large") {
            bottomScaleSection.visibility = View.VISIBLE
            if (isSingapore) {
                sgScaleSection.visibility = View.VISIBLE
                mainScaleTitle?.text = "Right Partition Font Size (Hourly)"
                topScaleSection.visibility = View.GONE
            } else {
                sgScaleSection.visibility = View.GONE
                topScaleSection.visibility = View.VISIBLE
                topScaleTitle?.text = "Top Partition Font Size (Weather Details)"
                mainScaleTitle?.text = "Top Partition Font Size (Hourly)"
            }
        } else {
            bottomScaleSection.visibility = View.GONE
            topScaleSection.visibility = View.GONE
            if (isSingapore) {
                sgScaleSection.visibility = View.VISIBLE
                mainScaleTitle?.text = "Right Partition Font Size"
            } else {
                sgScaleSection.visibility = View.GONE
                mainScaleTitle?.text = "Font Size"
            }
        }

        titleView.text = when (widgetFamily) {
            "small" -> "Configure Small Widget"
            "medium" -> "Configure Medium Widget"
            else -> "Configure Large Widget"
        }


        hourlyPicker.minValue = 0
        hourlyPicker.maxValue = 24
        hourlyPicker.wrapSelectorWheel = false
        hourlyPicker.value = (existing.hourlyCards ?: defaultHourlyCards(widgetFamily)).coerceIn(0, 24)
        
        transparentSwitch.isChecked = existing.isTransparent
        if (existing.isTextBlack) {
            colorBlack.isChecked = true
        } else {
            colorWhite.isChecked = true
        }
        
        customColorSection.visibility = if (existing.isTransparent) View.VISIBLE else View.GONE
        customColorInput.setText(existing.customThemeColor ?: "")

        transparentSwitch.setOnCheckedChangeListener { _, isChecked ->
            customColorSection.visibility = if (isChecked) View.VISIBLE else View.GONE
        }

        if (widgetFamily == "large") {
            dailySection.visibility = View.VISIBLE
            dailyPicker.minValue = 0
            dailyPicker.maxValue = 7
            dailyPicker.wrapSelectorWheel = false
            dailyPicker.value = (existing.dailyCards ?: 4).coerceIn(0, 7)
        } else {
            dailySection.visibility = View.GONE
            dailyPicker.value = 0
        }

        cancelButton.setOnClickListener {
            finish()
        }

        saveButton.setOnClickListener {
            val hourlyCards = hourlyPicker.value
            val dailyCards = if (widgetFamily == "large") dailyPicker.value else 0
            val isTransparent = transparentSwitch.isChecked
            val isTextBlack = colorBlack.isChecked
            val customThemeColor = customColorInput.text.toString().takeIf { isTransparent && it.isNotBlank() }
            val fontScale = 0.5f + fontScaleSeek.progress * 0.05f
            val sgLeftFontScale = 0.5f + sgScaleSeek.progress * 0.05f
            val topFontScale = 0.5f + topScaleSeek.progress * 0.05f
            val bottomFontScale = 0.5f + bottomScaleSeek.progress * 0.05f
            WeatherWidgetConfigStore.save(this, appWidgetId, hourlyCards, dailyCards, isTransparent, isTextBlack, customThemeColor, fontScale, sgLeftFontScale, topFontScale, bottomFontScale)

            requestWidgetUpdate(providerInfo?.provider)

            val result = Intent().apply {
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
            }
            setResult(RESULT_OK, result)
            finish()
        }
    }

    private fun resolveWidgetFamily(provider: ComponentName?): String {
        val className = provider?.className ?: return "large"
        return when {
            className.contains("Small", ignoreCase = true) -> "small"
            className.contains("Medium", ignoreCase = true) -> "medium"
            else -> "large"
        }
    }

    private fun defaultHourlyCards(widgetFamily: String): Int {
        return when (widgetFamily) {
            "small" -> 4
            else -> 6
        }
    }

    private fun requestWidgetUpdate(provider: ComponentName?) {
        if (provider == null) {
            return
        }

        val updateIntent = Intent(AppWidgetManager.ACTION_APPWIDGET_UPDATE).apply {
            component = provider
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, intArrayOf(appWidgetId))
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
        }
        sendBroadcast(updateIntent)
    }
}
