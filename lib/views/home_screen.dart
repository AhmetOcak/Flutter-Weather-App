import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/components/search_button.dart';
import 'package:wheather_app/components/weather_data_screen.dart';
import 'package:wheather_app/components/weather_window.dart';
import 'package:wheather_app/constants/constants.dart';
import 'package:wheather_app/models/weather_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final WeatherResponse _weatherResponse = WeatherResponse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Constants().night,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
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
      ),
    );
  }
}
