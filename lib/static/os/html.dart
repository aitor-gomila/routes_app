import 'package:flutter/foundation.dart';
import 'package:routes_app/static/os/common.dart';

class OS implements IOS {
  @override
  final isLinux = false;
  @override
  final isWindows = false;
  @override
  final isMacOS = false;
  @override
  final isAndroid = false;
  @override
  final isIOS = false;
  @override
  final isWeb = kIsWeb;
}
