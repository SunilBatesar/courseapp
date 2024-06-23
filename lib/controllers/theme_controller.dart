import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode _apptheme = ThemeMode.dark;
  ThemeMode get appTheme => _apptheme;
  setTheme(ThemeMode theme) {
    _apptheme = theme;
    Get.changeThemeMode(theme);
    update();
  }
}
