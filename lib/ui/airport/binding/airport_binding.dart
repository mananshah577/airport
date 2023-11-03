import 'package:airportdemo1/ui/airport/view/airport_controller.dart';
import 'package:get/get.dart';

class AirportBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AirportController());
  }
}