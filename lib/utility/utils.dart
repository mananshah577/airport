import 'package:airportdemo1/app/app_colors.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Utils {
  Utils._();

  /// Close keyboard
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showMessage(String message, {snackPosition = SnackPosition.BOTTOM}) {
    Flushbar(
      message:  message,borderRadius: BorderRadius.circular(10.r),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      backgroundColor: AppColors.to.primaryColor,
      flushbarPosition: FlushbarPosition.TOP,
      borderColor: AppColors.colorWhite,
      duration: const Duration(seconds: 3),
    ).show(Get.context as BuildContext);
  }
}