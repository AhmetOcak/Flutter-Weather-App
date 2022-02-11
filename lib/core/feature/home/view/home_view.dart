import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheather_app/core/components/button/search_button.dart';
import 'package:wheather_app/core/feature/home/model/weather_data_screen.dart';
import 'package:wheather_app/core/feature/home/model/weather_model.dart';
import 'package:wheather_app/core/feature/home/model/weather_window.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.weatherResponse}) : super(key: key);

  final WeatherResponse weatherResponse;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String readTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return date.toString().substring(11, 16);
  }

  bool checkTime() {
    // true = light    false = dark
    final hour = DateTime.now().hour;
    if (6 <= hour && hour <= 18) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            checkTime()
                ? 'assets/images/lightBG.svg'
                : 'assets/images/darkBG.svg',
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
                      cityName: widget.weatherResponse.cityName!
                          .replaceAll(RegExp('Province'), ''),
                      degree:
                          widget.weatherResponse.temp.toString().split('.')[0],
                      weatherForecast: widget.weatherResponse.description,
                    ),
                  ],
                ),
                WeatherDataScreen(
                  feelsLike: widget.weatherResponse.feelsLike
                          .toString()
                          .split('.')[0] +
                      "°",
                  windSpeed:
                      widget.weatherResponse.windSpeed.toString() + " km/h",
                  pressure: widget.weatherResponse.pressure.toString() + " mb",
                  sunrise: readTimestamp(
                      int.parse(widget.weatherResponse.sunRise.toString())),
                  humidity: widget.weatherResponse.humidity.toString() + " %",
                  sunset: readTimestamp(
                      int.parse(widget.weatherResponse.sunSet.toString())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}