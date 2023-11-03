import 'package:airportdemo1/app/app_colors.dart';
import 'package:airportdemo1/app/app_images.dart';
import 'package:airportdemo1/ui/splash/view/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.to.bgColor,
        body: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: Image.asset(
                AppImages.icSplash,
                fit: BoxFit.fill,
              ),
            ),
            /*Center(
              child: SizedBox(
                height: 204.h,
                width: 293.w,
                child: Image.asset(AppImages.icSplashLogo),
              ),
            ),*/
          ],
        ),
      );
    });
  }
}