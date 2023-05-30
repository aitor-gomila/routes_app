import 'package:system_tray/system_tray.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:routes_app/static/disposable.dart';
import 'package:routes_app/static/os/common.dart';
import 'package:routes_app/static/icon.dart';

class TrayService extends Disposable {
  late final AppWindow _appWindow;
  late final SystemTray _systemTray;

  TrayService() {
    if(!(OS.isWindows || OS.isLinux || OS.isMacOS)) return;
    initSystemTray();
  }

  void initSystemTray() {
    _systemTray.initSystemTray(iconPath: ApplicationIcon.getApplicationIcon());
    _systemTray.setTitle("Routes App");

    var menu = Menu();
    menu.buildFrom([
      MenuItemLabel(label: "Start/stop recording", onClicked: (_) {})
    ]);
  }

  @override
  void dispose() {}
}

class DesktopNotificationService {
  DesktopNotificationService() {
    const initializationSettings = InitializationSettings(
      linux: LinuxInitializationSettings(defaultActionName: "action")
    );
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }
}
