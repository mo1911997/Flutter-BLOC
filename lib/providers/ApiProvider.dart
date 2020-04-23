import 'dart:convert';
import 'package:bloc_demo/model/WeatherResponseModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {  
  final _baseUrl =
      "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22";

  Future<WeatherResponse> fetchLondonWeather() async {
    final response = await http.get("$_baseUrl");    
    print(response.body.toString());

    if (response.statusCode == 200) {
      return WeatherResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
  Future<void> addLocation(var lat,var long) async
  {
    print(lat);
    print(long);
    // final response = await http.post("some url",
    // body :{
    //   'lat':lat,
    //   'long':long
    // });
    // if(response.statusCode == 200)
    // {
    //   return response;
    // }
    // else 
    // {
    //   throw Exception('Failed to add location !');
    // }
  }
}