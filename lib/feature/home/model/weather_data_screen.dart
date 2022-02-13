import 'package:flutter/material.dart';

import 'package:weather_icons/weather_icons.dart';
import 'package:wheather_app/feature/home/model/weather_info_section.dart';

class WeatherDataScreen extends StatelessWidget {
  final String feelsLike;
  final String windSpeed;
  final String pressure;
  final String sunrise;
  final String humidity;
  final String sunset;

  const WeatherDataScreen({
    Key? key,
    this.feelsLike = 'xx',
    this.windSpeed = 'xx',
    this.pressure = 'xx',
    this.sunrise = 'xx',
    this.humidity = 'xx',
    this.sunset = 'xx',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.010,
      ),
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.010,
      ),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: 'feels like',
                    value: feelsLike,
                    iconData: WeatherIcons.thermometer,
                  ),
                  WeatherInfo(
                    title: 'wind speed',
                    value: windSpeed,
                    iconData: WeatherIcons.strong_wind,
                  ),
                  WeatherInfo(
                    title: 'pressure',
                    value: pressure,
                    iconData: WeatherIcons.barometer,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: 'sunrise',
                    value: sunrise,
                    iconData: WeatherIcons.sunrise,
                  ),
                  WeatherInfo(
                    title: 'humidity',
                    value: humidity,
                    iconData: WeatherIcons.humidity,
                  ),
                  WeatherInfo(
                    title: 'sunset',
                    value: sunset,
                    iconData: WeatherIcons.sunset,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
