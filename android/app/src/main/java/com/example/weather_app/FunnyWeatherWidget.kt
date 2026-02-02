package com.example.weather_app

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.os.Build
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

    val views = RemoteViews(context.packageName, R.layout.funny_weather_widget)
    views.setTextViewText(R.id.location_text, location)
    views.setTextViewText(R.id.temperature_text, temperature)


    val smallView = views
    val tallView = views
    val wideView = views

    val viewMapping: Map<SizeF, RemoteViews> = mapOf(
        SizeF(110f, 110f) to smallView,
        SizeF(110f, 250f) to tallView,
        SizeF(1100f, 350f) to wideView
    )

    val remoteViews : RemoteViews = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        RemoteViews(viewMapping)
    } else {
        views
    }

    appWidgetManager.updateAppWidget(appWidgetId, remoteViews)
}