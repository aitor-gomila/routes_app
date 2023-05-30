import 'package:routes_app/static/os/common.dart';

class ApplicationIcon {
  static String getApplicationIcon() => getIconImagePath("app_icon");

  static String getIconImagePath(String imageName) {
    return OS.isWindows ? 'assets/$imageName.ico' : 'assets/$imageName.png';
  }

  static String getImagePath(String imageName) {
    return OS.isWindows ? 'assets/$imageName.bmp' : 'assets/$imageName.png';
  }
}