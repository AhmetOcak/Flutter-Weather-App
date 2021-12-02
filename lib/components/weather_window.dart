import 'package:flutter/material.dart';

class WeatherWindow extends StatelessWidget {
  const WeatherWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'İstanbul',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '20°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 150,
                ),
              )
            ],
          ),
        ),
        const RotatedBox(
          quarterTurns: 1,
          child: Text(
            "hava durumu",
            style: TextStyle(
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
