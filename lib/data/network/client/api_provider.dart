import 'dart:convert';

import 'package:airportdemo1/data/local/database_helper.dart';
import 'package:airportdemo1/data/network/client/api_client.dart';
import 'package:airportdemo1/data/network/client/connectivity_manager.dart';
import 'package:airportdemo1/generated/locales.g.dart';
import 'package:airportdemo1/utility/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Define own methods of all types of api's. Like., GET, POST..etc
abstract class IApiProvider {
  Future<Either<String, dynamic>?> getMethod<T>(
      String url, {
        Map<String, dynamic>? query,
      });
}

/// Common custom api provider with get connect
class ApiProvider extends GetConnect implements IApiProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiClient.apiBaseUrl;
    httpClient.maxAuthRetries = 3;
  }

  @override
  Future<Either<String, dynamic>?> getMethod<T>(String url,
      {Map<String, dynamic>? query, bool isFullResponse = false}) async {
    try {
      //if (await ConnectivityManager().checkInternet()) {

        var result =
        await get(ApiClient.apiBaseUrl + url, query: query,);
        debugPrint(ApiClient.apiBaseUrl + url);
        //debugPrint('${result.body}');

         if (result.statusCode == Constants.isSuccess200) {
           return Right(json.decode(result.body));
        } else {
          return Left(LocaleKeys.somethingWentWrong.tr);
        }
      /* else {
        return Left(LocaleKeys.checkYourInternetConnection.tr);
      }*/
    } catch (e, s) {
      debugPrint('$e \n $s');
      return Left(LocaleKeys.somethingWentWrong.tr);
    }
  }

}
