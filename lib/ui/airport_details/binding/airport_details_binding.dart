import 'package:airportdemo1/ui/airport_details/view/airport_details_controller.dart';
import 'package:get/get.dart';

class AirportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AirportDetailsController());
  }
}