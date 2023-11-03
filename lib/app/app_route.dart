import 'package:airportdemo1/ui/airport/binding/airport_binding.dart';
import 'package:airportdemo1/ui/airport/view/airport_view.dart';
import 'package:airportdemo1/ui/airport_details/binding/airport_details_binding.dart';
import 'package:airportdemo1/ui/airport_details/view/airport_details_view.dart';
import 'package:airportdemo1/ui/splash/binding/splash_binding.dart';
import 'package:airportdemo1/ui/splash/view/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const airportPage = '/airport_page';
  static const airportDetailsPage = '/airport__details_page';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const SplashView(),
      binding: SplashBinding(),
      //  transition: Transition.rightToLeft
    ),
    GetPage(
      name: AppRoutes.airportPage,
      page: () => const AirportView(),
      binding: AirportBinding(),
      //  transition: Transition.rightToLeft
    ),
    GetPage(
      name: AppRoutes.airportDetailsPage,
      page: () => const AirportDetailsView(),
      binding: AirportDetailsBinding(),
      //  transition: Transition.rightToLeft
    ),
  ];
}