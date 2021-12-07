import 'package:flutter/material.dart';
import 'package:wheather_app/components/weather_info_section.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDataScreen extends StatelessWidget {
  String feelsLike;
  String windSpeed;
  String pressure;
  String sunrise;
  String humidity;
  String sunset;

  WeatherDataScreen({
    this.feelsLike = 'xx',
    this.windSpeed = 'xx',
    this.pressure = 'xx',
    this.sunrise = 'xx',
    this.humidity = 'xx',
    this.sunset = 'xx',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 30,),
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 3.5,
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
            left: MediaQuery.of(context).size.width / 12,
            right: MediaQuery.of(context).size.width / 12,
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
