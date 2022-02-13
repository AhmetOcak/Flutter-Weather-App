import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wheather_app/feature/home/model/search_button.dart';
import 'package:wheather_app/feature/home/model/weather_data_screen.dart';
import 'package:wheather_app/feature/home/model/weather_model.dart';
import 'package:wheather_app/feature/home/model/weather_window.dart';
import 'package:wheather_app/feature/home/viewmodel/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.weatherResponse}) : super(key: key);

  final WeatherResponse weatherResponse;
  final String _lightBgPath = 'assets/images/lightBG.svg';
  final String _darkBgPath = 'assets/images/darkBG.svg';

  final String _cityName = 'Province';
  final String _degree = '°';
  final String _km = " km/h";
  final String _pressure = " mb";
  final String _percee = " %";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            HomeViewModel().checkTime()
                ? widget._lightBgPath
                : widget._darkBgPath,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          dataArea(),
        ],
      ),
    );
  }

  SafeArea dataArea() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SearchButton(),
              WeatherWindow(
                cityName: widget.weatherResponse.cityName
                    ?.replaceAll(RegExp(widget._cityName), ''),
                degree: widget.weatherResponse.temp.toString().split('.')[0],
                weatherForecast: widget.weatherResponse.description,
              ),
            ],
          ),
          WeatherDataScreen(
            feelsLike:
                widget.weatherResponse.feelsLike.toString().split('.')[0] +
                    widget._degree,
            windSpeed: widget.weatherResponse.windSpeed.toString() + widget._km,
            pressure:
                widget.weatherResponse.pressure.toString() + widget._pressure,
            sunrise: HomeViewModel().readTimestamp(
                int.parse(widget.weatherResponse.sunRise.toString())),
            humidity:
                widget.weatherResponse.humidity.toString() + widget._percee,
            sunset: HomeViewModel().readTimestamp(
                int.parse(widget.weatherResponse.sunSet.toString())),
          ),
        ],
      ),
    );
  }
}
