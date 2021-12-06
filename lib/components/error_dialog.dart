import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  ErrorDialog({required this.errorMesage});

  final String errorMesage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      title: const Text(
        'Location Error',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        errorMesage.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        side: BorderSide(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context); // problem is here
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
