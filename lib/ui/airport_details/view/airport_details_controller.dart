import 'dart:io';

import 'package:airportdemo1/app/app_colors.dart';
import 'package:airportdemo1/generated/locales.g.dart';
import 'package:airportdemo1/widgets/common_text.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AirportDetailsController extends GetxController {

  RxSet<Marker> markers = <Marker>{}.obs;
  late GoogleMapController mapController;
  final Map<String, dynamic> arguments = Get.arguments ?? {};
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString airportName = "".obs;
  RxString airportCity = "".obs;
  RxString airportState = "".obs;
  RxString airportCountry = "".obs;
  CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  final String mapUrl =
      "https://maps.googleapis.com/maps/api/staticmap?center=37.7749,-122.4194&zoom=12&size=400x400&key=AIzaSyCdQfxwSzj7TlTsQSy7FeGn9vc8OizKk38";


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    latitude.value = arguments["latitude"];
    longitude.value = arguments["longitude"];
    airportName.value = arguments["airportName"];
    airportCity.value = arguments["airportCity"];
    airportState.value = arguments["airportState"];
    airportCountry.value = arguments["airportCountry"];
    markers.value = {
      Marker(
        markerId: const MarkerId("markerAirport"),
        position: LatLng(latitude.value, longitude.value),
        onTap: (){
          customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: AppColors.to.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 8.h,bottom: 8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CommonSoraText(
                            text: "${LocaleKeys.name.tr} : ",
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          ),
                          Expanded(
                            child: CommonSoraText(
                              text: airportName.value,
                              textSize: 12.sp,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.colorWhite,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CommonSoraText(
                            text: "${LocaleKeys.city.tr} : ",
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          ),
                          CommonSoraText(
                            text: airportCity.value,
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CommonSoraText(
                            text: "${LocaleKeys.state.tr} : ",
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          ),
                          CommonSoraText(
                            text: airportState.value,
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CommonSoraText(
                            text: "${LocaleKeys.country.tr} : ",
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          ),
                          CommonSoraText(
                            text: airportCountry.value,
                            textSize: 12.sp,
                            color: AppColors.colorWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              LatLng(latitude.value,longitude.value)
          );
        }
      )
    };
  }

  Future<BitmapDescriptor> getImage(
      BuildContext context, String url) async {
    File file = await DefaultCacheManager().getSingleFile(url);
    Uint8List bytes = await file.readAsBytes();
    return BitmapDescriptor.fromBytes(bytes);
  }
}