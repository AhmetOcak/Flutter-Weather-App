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
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width / 3,
            top: MediaQuery.of(context).size.height / 20,
          ),
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RotatedBox(
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
        ),
      ],
    );
  }
}
