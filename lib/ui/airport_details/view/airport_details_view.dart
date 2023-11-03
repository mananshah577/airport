import 'package:airportdemo1/generated/locales.g.dart';
import 'package:airportdemo1/ui/airport_details/view/airport_details_controller.dart';
import 'package:airportdemo1/widgets/common_app_bar_with_centertitle.dart';
import 'package:airportdemo1/widgets/common_progress_indicator.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AirportDetailsView extends GetView<AirportDetailsController> {
  const AirportDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(61.h),
          child: CommonAppBarWithCenterTitle(
            title: LocaleKeys.airportDetails.tr,
            isVisibleIcon: true,
            onLeadingPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Obx(() {
            return Stack(
              children: [
                FutureBuilder(
                  future: controller.getImage(context, controller.mapUrl),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GoogleMap(
                        zoomGesturesEnabled: true,
                        myLocationEnabled: true,
                        compassEnabled: true,
                        mapToolbarEnabled: true,
                        tiltGesturesEnabled: true,
                        myLocationButtonEnabled: true,
                        indoorViewEnabled: true,
                        trafficEnabled: true,
                        onMapCreated: (control){
                          controller.customInfoWindowController.googleMapController = control;
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(controller.latitude.value, controller.longitude.value),
                          zoom: 11.0,
                        ),
                        markers:  controller.markers.value,
                        onCameraMove: (position) {
                          controller.customInfoWindowController.onCameraMove!();
                        },
                        onTap: (latLng) {
                          controller.customInfoWindowController.hideInfoWindow!();
                        },
                      );
                    }
                    else {
                      return const Center(child: CommonProgressIndicator());
                    }

                  }
                ),
                CustomInfoWindow(
                  controller: controller.customInfoWindowController,
                  width: 250.w,
                  height: 90.h,
                  offset: 45,
                ),
              ],
            );
          }),
        ));
  }
}
