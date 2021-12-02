import 'package:flutter/material.dart';
import 'package:wheather_app/constants/constants.dart';

class WeatherInfo extends StatelessWidget {
  final String title;
  // final String icon;
  // final String value;

  WeatherInfo({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image(
        //   image: NetworkImage(
        //     'http://openweathermap.org/img/wn/' +
        //         _weatherResponse.icon.toString()  +
        //         '.png',
        //   ),
        // ),
        Text(
          '15',
          style: Constants().weatherInfoStyle().copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          title,
          style: Constants().weatherInfoStyle(),
        ),
      ],
    );
  }
}
