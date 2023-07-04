export 'package:routes_app/static/os/io.dart' if (kIsWeb) 'package:routes_app/os/html.dart';

abstract class IOS {
  abstract final bool isLinux;
  abstract final bool isWindows;
  abstract final bool isMacOS;
  abstract final bool isAndroid;
  abstract final bool isIOS;
  abstract final bool isWeb;
}
