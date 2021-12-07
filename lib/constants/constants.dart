import 'package:flutter/material.dart';

const Color afternoon1 = Color.fromRGBO(125, 180, 235, 1.0);
const Color afternoon2 = Color.fromRGBO(134, 210, 246, 1.0);
const Color afternoon3 = Color.fromRGBO(177, 234, 247, 1.0);
const Color afternoon4 = Color.fromRGBO(249, 246, 178, 1.0);
const Color afternoon5 = Color.fromRGBO(246, 242, 76, 1.0);
const Color afternoon6 = Color.fromRGBO(181, 235, 81, 1.0);

class Constants {
  List<Color> afternoon = [
    afternoon1,
    afternoon2,
    afternoon3,
    afternoon4,
    afternoon5,
    afternoon6,
  ];

  TextStyle weatherInfoStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w300,
    );
  }
}
