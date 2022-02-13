import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheather_app/core/components/alert_dialog/alert_dialog.dart';
import 'package:wheather_app/feature/home/model/weather_model.dart';
import 'package:wheather_app/feature/home/services/weather_service.dart';
import 'package:wheather_app/feature/home/view/home_view.dart';
import 'package:wheather_app/feature/loading_screen/services/get_location.dart';

class LoadingViewModel {
  WeatherResponse _weatherResponse = WeatherResponse();
  final DataService _dataService = DataService();

  Future<WeatherResponse> _search(String cityName) async {
    WeatherResponse response = await _dataService.getWeatherData(cityName);
    _weatherResponse = response;
    return _weatherResponse;
  }

  void getLocationWeather(BuildContext context) async {
    List<Placemark> location = [];
    try {
      location = await getCurrentLocation();
      _search(location[0].administrativeArea.toString()).then((value) => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen(
                weatherResponse: _weatherResponse,
              );
            })),
          });
    } on PermissionDeniedException catch (e) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage: e.toString(),
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    } on PlatformException {
      showDialog(
        context: context,
        builder: (_) => const ErrorDialog(
          errorMesage:
              'We couldn\'t get the location. This error can be caused by bad internet. Please restart the application.',
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage: e.toString(),
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    }
  }
}
