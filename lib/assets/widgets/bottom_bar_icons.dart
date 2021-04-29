import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

class BottomBarIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  BottomBarIcon({@required this.image,@required this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: <Widget>[
            Image.asset("image/$image", width: 25, height: 25,),
            SizedBox(height: 2,),
            CustomText(text: name,)
          ],
        ),
      ),
    );
  }
}
