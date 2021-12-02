import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 45,
        color: Colors.white,
      ),
    );
  }
}
