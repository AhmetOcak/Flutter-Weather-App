import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:wheather_app/components/search_button.dart';
import 'package:wheather_app/components/weather_data_screen.dart';
import 'package:wheather_app/components/weather_window.dart';
import 'package:wheather_app/models/get_location.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherResponse _weatherResponse = WeatherResponse();
  final DataService _dataService = DataService();

  List<Placemark> location = [];

  @override
  void initState() {
    getCurrentLocation().then((value) => {
          location = value,
          search(location[0].administrativeArea.toString()),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          'assets/images/darkBG.svg',
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SearchButton(),
                  WeatherWindow(
                    cityName: _weatherResponse.cityName,
                    degree: _weatherResponse.temp.toString().split('.')[0],
                    weatherForecast: _weatherResponse.description,
                  ),
                ],
              ),
              WeatherDataScreen(),
            ],
          ),
        ),
      ],
    ));
  }

  void search(String cityName) async {
    final response = await _dataService.getWeatherData(cityName);
    setState(() {
      _weatherResponse = response;
    });
  }
}
