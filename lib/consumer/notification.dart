import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:routes_app/static/disposable.dart';
import 'package:routes_app/static/os/common.dart';
import 'package:routes_app/static/icon.dart';

import 'package:routes_app/server/recording.dart';

class AndroidNotificationService extends Disposable {
  late final RecordingService _recordingService;

  AndroidNotificationService(BuildContext context) {
    if (!OS.isAndroid) return;

    _recordingService = context.read<RecordingService>();
    showNotification();
  }

  Future<void> initNotification() async {
    final initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(ApplicationIcon.getApplicationIcon())
    );
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }

  void showNotification() {
    var androidNotificationDetails = const AndroidNotificationDetails("org.aitor_gomila.routes_app", "Routes app",
        playSound: false,
        ongoing: true,
        actions: [
          AndroidNotificationAction("start-recording", "Start recording"),
          AndroidNotificationAction("stop-recording", "Stop recording")
        ],
      );

    FlutterLocalNotificationsPlugin().show(0, "Routes App", _recordingService.isRecordingActive ? "Recording ongoing" : "Recording stopped", NotificationDetails(android: androidNotificationDetails));
  }

  @override
  void dispose() {}
}