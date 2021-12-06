import 'package:flutter/material.dart';

class SearchCityForm extends StatelessWidget {
  const SearchCityForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 4,
      ),
      child: const TextField(
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: "Enter city name",
          hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20,
        ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
