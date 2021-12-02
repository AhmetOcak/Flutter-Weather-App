import 'package:flutter/material.dart';
import 'package:wheather_app/components/search_button.dart';
import 'package:wheather_app/components/weather_window.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: const [
            SearchButton(),
            WeatherWindow(),
          ],
        ),
      ),
    );
  }
}


