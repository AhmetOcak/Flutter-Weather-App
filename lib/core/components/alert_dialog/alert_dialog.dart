import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.errorMesage,
    required this.errorTitle,
    this.killTheApp = false,
  }) : super(key: key);

  final String errorMesage;
  final String errorTitle;
  final bool killTheApp;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
      title: Text(
        errorTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: Theme.of(context).textTheme.headline5!.fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        errorMesage.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: Theme.of(context).textTheme.headline6!.fontSize,
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
              killTheApp ? SystemNavigator.pop() : Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.headline5!.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
