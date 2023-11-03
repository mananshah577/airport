import 'package:airportdemo1/app/app_class.dart';
import 'package:airportdemo1/app/app_colors.dart';
import 'package:airportdemo1/app/app_route.dart';
import 'package:airportdemo1/app/app_theme.dart';
import 'package:airportdemo1/generated/locales.g.dart';
import 'package:airportdemo1/widgets/scrollgrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put(AppColors());
  runApp(const MyApp(initialRoute: AppRoutes.initialRoute,));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppTheme.designSize,
      builder: (_, widget) => GetMaterialApp(
        scrollBehavior: MyBehavior(),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        title: 'Airport',
        theme: ThemeData(
          primaryColor: AppColors.to.primaryColor,
          // Other theme properties
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        builder: (context, widget) =>
            getMainAppViewBuilder(context, widget),
        getPages: AppRoutes.pages,
        initialRoute: initialRoute,
        translationsKeys: AppTranslation.translations,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en'),
      ),
    );
  }
  /// Create main app view builder
  Widget getMainAppViewBuilder(
      BuildContext context, Widget? widget) {
    return Stack(
      children: [
        Obx(() {
          return IgnorePointer(
            ignoring: AppClass().isShowLoading.isTrue,
            child: Stack(
              children: [
                widget ?? const Offstage(),
                if (AppClass()
                    .isShowLoading
                    .isTrue) // Top level loading ( used while api calls)
                  ColoredBox(
                    color: AppColors.colorBlack.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.colorWhite),
                    ),
                  ),
              ],
            ),
          );
        })
      ],
    );
  }
}
