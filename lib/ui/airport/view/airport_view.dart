import 'package:airportdemo1/app/app_colors.dart';
import 'package:airportdemo1/app/app_route.dart';
import 'package:airportdemo1/generated/locales.g.dart';
import 'package:airportdemo1/ui/airport/view/airport_controller.dart';
import 'package:airportdemo1/widgets/common_app_bar_with_centertitle.dart';
import 'package:airportdemo1/widgets/common_progress_indicator.dart';
import 'package:airportdemo1/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AirportView extends GetView<AirportController> {
  const AirportView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(61.h),
            child: CommonAppBarWithCenterTitle(
              title: controller.isInternet.value == false ? LocaleKeys.appNameOffline.tr : LocaleKeys.appName.tr,
              isVisibleIcon: false,
            ),
          ),
          body: Obx(() {
            return airportDataView();
          }));
    });
  }

  Widget airportDataView() {
    return controller.isAirportDataLoading.value
        ? CommonProgressIndicator(color: AppColors.to.primaryColor)
        : ListView.builder(
      shrinkWrap: true,
      itemCount: controller.isInternet.isFalse ? controller.airportDataFromLocal.length : controller.airportData.length,
      itemBuilder: (context, index) {
        var keys = controller.airportData.keys.toList();
        return GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: AppColors.to.textColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CommonSoraText(
                          text: "${LocaleKeys.name.tr} :",
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                        Spacer(),
                        CommonSoraText(
                          text: controller.isInternet.isFalse
                              ? controller.airportDataFromLocal[index]["name"]
                              : controller.airportData[keys[index]]["name"],
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CommonSoraText(
                          text: "${LocaleKeys.city.tr} , ",
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                        CommonSoraText(
                          text: "${LocaleKeys.state.tr} :",
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                        Spacer(),
                        CommonSoraText(
                          text: controller.isInternet.isFalse
                              ? "${controller.airportDataFromLocal[index]["city"]} , "
                              : "${controller.airportData[keys[index]]["city"]} , ",
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                        CommonSoraText(
                          text: controller.isInternet.isFalse
                              ? controller.airportDataFromLocal[index]["state"]
                              : controller.airportData[keys[index]]["state"],
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CommonSoraText(
                          text: "${LocaleKeys.country.tr} :",
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                        Spacer(),
                        CommonSoraText(
                          text: controller.isInternet.isFalse
                              ? controller.airportDataFromLocal[index]["country"]
                              : controller.airportData[keys[index]]["country"],
                          textSize: 14.sp,
                          color: AppColors.colorWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          onTap: () {
            Map<String, dynamic> params = {};
            params.addAll({"latitude": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["lat"] : controller.airportData[keys[index]]["lat"]});
            params.addAll({"longitude": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["lon"] : controller.airportData[keys[index]]["lon"]});
            params.addAll({"airportName": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["name"] : controller.airportData[keys[index]]["name"]});
            params.addAll({"airportCity": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["city"] : controller.airportData[keys[index]]["city"]});
            params.addAll({"airportState": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["state"] : controller.airportData[keys[index]]["state"]});
            params.addAll({"airportCountry": controller.isInternet.isFalse ? controller.airportDataFromLocal[index]["country"] : controller.airportData[keys[index]]["country"]});
            Get.toNamed(AppRoutes.airportDetailsPage, arguments: params);
          },
        );
      },
    );
  }
}
