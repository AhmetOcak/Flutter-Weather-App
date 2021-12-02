import 'package:flutter/material.dart';

class FindButton extends StatelessWidget {
  const FindButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
        ),
      ),
      child: const Text(
        'Find',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
