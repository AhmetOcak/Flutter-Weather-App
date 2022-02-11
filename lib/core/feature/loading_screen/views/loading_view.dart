import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheather_app/core/components/alert_dialog/alert_dialog.dart';
import 'package:wheather_app/core/feature/loading_screen/services/get_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheather_app/core/feature/home/model/weather_model.dart';
import 'package:wheather_app/core/feature/home/services/weather_service.dart';
import 'package:wheather_app/core/feature/home/view/home_view.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

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
          errorTitle: 'Location Error',
          killTheApp: true,
        ),
      );
    } on PlatformException {
      showDialog(
        context: context,
        builder: (_) => const ErrorDialog(
          errorMesage: 'We couldn\'t get the location. This error can be caused by bad internet. Please restart the application.',
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

  Future<WeatherResponse> search(String cityName) async {
    WeatherResponse response = await _dataService.getWeatherData(cityName);
    _weatherResponse = response;
    return _weatherResponse;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitDualRing(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
