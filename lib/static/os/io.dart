import 'dart:io';
import 'package:routes_app/static/os/common.dart';

class OS implements IOS {
  @override
  final bool isLinux = Platform.isLinux;
  @override
  final bool isWindows = Platform.isWindows;
  @override
  final bool isMacOS = Platform.isMacOS;
  @override
  final bool isAndroid = Platform.isAndroid;
  @override
  final bool isIOS = Platform.isIOS;
  @override
  final bool isWeb = false;
}
