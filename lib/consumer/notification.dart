import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:routes_app/static/disposable.dart';
import 'package:routes_app/static/os/common.dart';
import 'package:routes_app/static/icon.dart';

import 'package:routes_app/server/recording.dart';

class AndroidNotificationService extends Disposable {
  late final RecordingService _recordingService;
  final int _notificationId = 0;

  AndroidNotificationService(BuildContext context) {
    if (!OS.isAndroid) return;

    _recordingService = context.read<RecordingService>(); 
  }

  Future<void> initNotification() async {
    final initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(ApplicationIcon.getApplicationIcon())
    );
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }

  void showNotification() {
    const startNotificationAction = AndroidNotificationAction("start-recording", "start");
    const stopNotificationAction = AndroidNotificationAction("stop-recording", "stop");

    final androidNotificationDetails = AndroidNotificationDetails("org.aitor_gomila.routes_app", "Routes app",
      playSound: false,
      ongoing: true,
      actions: [
        // Show stop message if recording, otherwise show start message
        _recordingService.isRecordingActive ?stopNotificationAction : startNotificationAction
      ],
    );

    final notificationDetails = NotificationDetails(android: androidNotificationDetails);

    FlutterLocalNotificationsPlugin().show(_notificationId, "Routes App", _recordingService.isRecordingActive ? "Recording ongoing" : "Recording stopped", notificationDetails);
  }

  @override
  void dispose() {
    
  }
}