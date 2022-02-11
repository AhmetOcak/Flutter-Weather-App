import 'package:flutter/material.dart';

class WeatherWindow extends StatelessWidget {
  const WeatherWindow({
    Key? key,
    this.cityName = 'city name',
    this.degree = 'XX',
    this.weatherForecast = 'weatherForecast',
  }) : super(key: key);

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
            right: MediaQuery.of(context).size.width * 0.3,
            top: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityName!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline2!.fontSize,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '$degree°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline1!.fontSize! * 1.5,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05,),
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              weatherForecast!,
              style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
