import 'dart:convert';

import 'package:wheather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeatherData(String city) async {
    final queryParameters = {
      'appid': 'your api key', // Enter your api key here
      'q': city,
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
