import 'package:flutter/material.dart';
import 'package:wheather_app/core/feature/home/model/weather_model.dart';
import 'package:wheather_app/core/feature/home/view/home_view.dart';
import 'package:wheather_app/core/feature/loading_screen/views/loading_view.dart';
import 'package:wheather_app/core/feature/search_city/view/search_city_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/home': (context) => HomeScreen(
              weatherResponse: WeatherResponse(),
            ),
        '/search': (context) => SearchScreen(),
      },
    ),
  );
}

// background images from Vecteezy.com