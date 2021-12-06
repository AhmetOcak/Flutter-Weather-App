import 'package:flutter/material.dart';

class WeatherWindow extends StatelessWidget {
  WeatherWindow({
    this.cityName = 'city name',
    this.degree = 'XX',
    this.weatherForecast = 'weatherForecast',
  });

  final String? cityName;
  final String? degree;
  final String? weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '$degree°',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 150,
                ),
              )
            ],
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            weatherForecast!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
