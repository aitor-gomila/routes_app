import 'dart:io';

class  OS {
  static final isLinux = Platform.isLinux;
  static final isWindows = Platform.isWindows;
  static final isMacOS = Platform.isMacOS;
  static final isAndroid = Platform.isAndroid;
  static final isIOS = Platform.isIOS;
  static const isWeb = false;
}
