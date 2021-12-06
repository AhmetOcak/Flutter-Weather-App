import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:wheather_app/constants/constants.dart';

class WeatherInfo extends StatelessWidget {
  WeatherInfo(
      {required this.title, required this.value, required this.iconData});

  final String title;
  final IconData iconData;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxedIcon(
          iconData,
          color: Colors.white,
        ),
        Text(
          value,
          style: Constants()
              .weatherInfoStyle()
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          title,
          style: Constants().weatherInfoStyle(),
        ),
      ],
    );
  }
}
