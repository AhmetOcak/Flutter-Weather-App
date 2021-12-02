import 'package:flutter/material.dart';
import 'package:wheather_app/views/home_screen.dart';
import 'package:wheather_app/views/search_city_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/search': (context) => SearchScreen(),
    },
  ));
}

// background images from Vecteezy.com