import 'package:airportdemo1/data/local/database_helper.dart';
import 'package:airportdemo1/data/network/client/connectivity_manager.dart';
import 'package:airportdemo1/data/network/repository/app_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';

class AirportController extends GetxController {

  RxBool isAirportDataLoading = true.obs;
  RxBool isInternet = false.obs;
  RxMap<String,dynamic> airportData = <String,dynamic>{}.obs;
  RxList<dynamic> airportDataFromLocal = [].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkConnectivity();
    });
  }

  ///Get Airport Data
  void getAirportData() async {
    if (await ConnectivityManager().checkInternet()) {
      isInternet.value = true;
      AppRepository().getAirportData().then((value) {
        value?.fold((l) {
          isAirportDataLoading.value = false;
        }, (r) async {
          isAirportDataLoading.value = false;
          airportData.addAll(r);
          Map<String, dynamic> row = {};
          var keys = airportData.keys.toList();
          Database? db = await DatabaseHelper.instance.database;
          await db!.rawDelete('DELETE FROM ${DatabaseHelper.table}');
          for (int i = 0 ; i < airportData.length ; i++) {
            row = {
              DatabaseHelper.columnAirportIcao : airportData[keys[i]]["icao"],
              DatabaseHelper.columnAirportIata  : airportData[keys[i]]["iata"],
              DatabaseHelper.columnAirportName : airportData[keys[i]]["name"],
              DatabaseHelper.columnAirportCity : airportData[keys[i]]["city"],
              DatabaseHelper.columnAirportState : airportData[keys[i]]["state"],
              DatabaseHelper.columnAirportCountry : airportData[keys[i]]["country"],
              DatabaseHelper.columnAirportElevation : airportData[keys[i]]["elevation"],
              DatabaseHelper.columnAirportLatitude : airportData[keys[i]]["lat"],
              DatabaseHelper.columnAirportLongitude : airportData[keys[i]]["lon"],
              DatabaseHelper.columnAirportTimeZone : airportData[keys[i]]["tz"],
            };
            DatabaseHelper.instance.insertAirport(row);
          }
        });
      });
    }
    else {
      isAirportDataLoading.value = false;
      isInternet.value = false;
      airportDataFromLocal.value = await DatabaseHelper.instance.fetchAirportData();
    }
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print("connectivityResult :: $connectivityResult");
    if (connectivityResult == ConnectivityResult.none) {
      //isInternet.value = false;
      getAirportData();
    } else {
      isInternet.value = true;
      getAirportData();
    }
  }

}