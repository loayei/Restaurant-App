import 'package:flutter/material.dart';
// A widget for the loading screen to be called.
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
      ],
    );
  }
}
