import 'package:airportdemo1/ui/splash/view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppColors extends GetxController {
  static AppColors get to => Get.find();

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    Get.put(SplashController());
    super.onInit();
  }

  Color get primaryColor => isDarkMode.value ? _darkPrimaryColor : _lightPrimaryColor;

  Color get bgColor => isDarkMode.value ? _darkBgColor : _lightBgColor;

  Color get textColor => isDarkMode.value ? _darkTextColor : _lightTextColor;

  Color get buttonTextColor => isDarkMode.value ? _darkBtnTextColor : _lightBtnTextColor;

  // Light mode colors
  static const Color _lightPrimaryColor = Color(0xFF546032);
  static const Color _lightTextColor = Color(0xFF09331D);
  static const Color _lightBgColor = Color(0xFFFFFFFF);
  static const Color _lightBtnTextColor = Color(0xFFFFFFFF);

  // Dark mode colors
  static const Color _darkPrimaryColor = Color(0xFF546032);
  static const Color _darkTextColor = Color(0xFF09331D);
  static const Color _darkBgColor = Color(0xFFFFFFFF);
  static const Color _darkBtnTextColor = Color(0xFFFFFFFF);

  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorBlack = Color(0xFF000000);


}