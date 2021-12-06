import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheather_app/components/error_dialog.dart';
import 'package:wheather_app/models/get_location.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';
import 'package:wheather_app/views/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherResponse _weatherResponse = WeatherResponse();
  final DataService _dataService = DataService();
  List<Placemark> location = [];

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    try {
      location = await getCurrentLocation();
      search(location[0].administrativeArea.toString()).then((value) => {
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
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          errorMesage: e.toString(),
        ),
      );
    }
  }

  Future<WeatherResponse> search(String cityName) async {
    WeatherResponse response = await _dataService.getWeatherData(cityName);
    _weatherResponse = response;
    return _weatherResponse;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
