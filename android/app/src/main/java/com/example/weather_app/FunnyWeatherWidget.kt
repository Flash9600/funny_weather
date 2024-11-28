package com.example.weather_app

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.util.SizeF
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin


class FunnyWeatherWidget : AppWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}

internal fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {

    val widgetData = HomeWidgetPlugin.getData(context)
    val location = widgetData.getString("location", null)
    val temperature = widgetData.getString("temperature", null)

    val views = RemoteViews(context.packageName, R.layout.funny_weather_widget).apply { 
        setTextViewText(R.id.location_text, location)
        setTextViewText(R.id.temperature_text, temperature)
    }

    appWidgetManager.updateAppWidget(appWidgetId, views)
}