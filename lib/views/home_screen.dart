import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheather_app/components/search_button.dart';
import 'package:wheather_app/components/weather_data_screen.dart';
import 'package:wheather_app/components/weather_window.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/services/weather_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherResponse _weatherResponse = WeatherResponse();
  final DataService _dataService = DataService();

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
                children: const [
                  SearchButton(),
                  WeatherWindow(),
                ],
              ),
              WeatherDataScreen(),
            ],
          ),
        ),
      ],
    ));
  }
}
