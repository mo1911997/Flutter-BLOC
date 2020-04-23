import 'package:rxdart/rxdart.dart';
import 'package:bloc_demo/model/WeatherResponseModel.dart';
import 'package:bloc_demo/repositories/Repository.dart';

//Sinks are used to add the input received from repository to the stream . 
//The data from Sinks is passed to the UI in the form of a stream .
class WeatherBloc {
  Repository _repository = Repository();

  final _weatherFetcher = PublishSubject<WeatherResponse>();
  final lat = BehaviorSubject<String>();
  final long = BehaviorSubject<String>();

  Stream<WeatherResponse> get weather => _weatherFetcher.stream;
  Function(String) get getLat => lat.sink.add;
  Function(String) get getLong => long.sink.add;

  addLoc(){
    _repository.addLocation(lat.value, long.value);
  }

  fetchLondonWeather() async {
    WeatherResponse weatherResponse = await _repository.fetchLondonWeather();
    _weatherFetcher.sink.add(weatherResponse);
  }

  dispose() {
    lat.close();
    long.close();
    _weatherFetcher.close();
  }
}

final weatherBloc = WeatherBloc();
