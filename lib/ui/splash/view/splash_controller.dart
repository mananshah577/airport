import 'dart:io';
import 'package:airportdemo1/app/app_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    if(Platform.isAndroid){
      FlutterNativeSplash.remove();
    }
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.airportPage);
    });
    super.onReady();
  }
}