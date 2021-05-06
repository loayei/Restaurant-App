import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurants_app/assets/helpers/style.dart';

// A package for the loading icon to be called.
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        child: SpinKitThreeBounce(
          color: black,
          size: 25.0,
        ));
  }
}
