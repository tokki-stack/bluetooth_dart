package com.thatproject.flutter_app_esp32_dust_sensor;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.androidalarmmanager.AlarmService;
import io.flutter.plugins.androidalarmmanager.AndroidAlarmManagerPlugin;

class Application : FlutterApplication(), PluginRegistrantCallback {
      override fun onCreate() {
        super.onCreate();
        AlarmService.setPluginRegistrant(this);
      }

      override fun registerWith(registry: PluginRegistry) {
        // GeneratedPluginRegistrant.registerWith(registry);
        AndroidAlarmManagerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.androidalarmmanager.AndroidAlarmManagerPlugin"));
      }
}