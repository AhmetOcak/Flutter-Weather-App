import 'dart:convert';

import 'package:wheather_app/core/feature/home/model/weather_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeatherData(String city) async {
    final queryParameters = {
      'appid': '18fcba115a2815e21a21379f65b994ed', // Enter your api key here
      'q': city,
      'units': 'metric'
    };

    final uri = Uri.https(
      'api.openweathermap.org',
      'data/2.5/weather',
      queryParameters,
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}