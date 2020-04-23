import 'package:bloc_demo/model/WeatherResponseModel.dart';
import 'package:bloc_demo/providers/ApiProvider.dart';

// This file is used to send data received from server to BLOC class 
class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<WeatherResponse> fetchLondonWeather() => appApiProvider.fetchLondonWeather();
  Future<void> addLocation(var lat,var long) => appApiProvider.addLocation(lat, long);
}