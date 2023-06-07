import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:routes_app/static/os/common.dart';

import 'package:routes_app/server/route.dart';
import 'package:routes_app/server/recording.dart';

import 'package:routes_app/consumer/notification.dart';
import 'package:routes_app/consumer/tray.dart';

import 'package:routes_app/material.dart';

Widget getMainApplication() {
  if (OS.isAndroid) return const MaterialApplication();
  // For web, or if anything else fails...
  return const MaterialApplication();
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RouteList(context)),
        ChangeNotifierProvider(create: (context) => RecordingService(context)),
        Provider(create: (context) => AndroidNotificationService(context)),
        Provider(create: (context) => TrayService()),
      ],
      child: getMainApplication(),
    )
  );
}
