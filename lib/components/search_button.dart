import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/search',
              );
            },
            icon: Icon(
              Icons.search,
              size: MediaQuery.of(context).size.width * 0.1,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
