import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wheather_app/feature/home/model/weather_model.dart';

class DataService {

  final String _authority = 'api.openweathermap.org';
  final String _unencodedPath = 'data/2.5/weather';

  Future<WeatherResponse> getWeatherData(String city) async {
    final queryParameters = {
      'appid': '18fcba115a2815e21a21379f65b994ed', // Enter your api key here
      'q': city,
      'units': 'metric'
    };

    final uri = Uri.https(
      _authority,
      _unencodedPath,
      queryParameters,
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
