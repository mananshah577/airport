import 'package:airportdemo1/data/network/client/api_client.dart';
import 'package:airportdemo1/data/network/client/api_provider.dart';
import 'package:dartz/dartz.dart';

class AppRepository extends ApiProvider {

  Future<Either<String, dynamic>?> getAirportData() async {
    var response = await getMethod<dynamic>(ApiClient.airportData);
    return response?.fold((l) => Left(l), (r) => Right(r as dynamic));
  }
}
