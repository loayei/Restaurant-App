import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/models/category.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import '../helpers/style.dart';
import 'title.dart';

List<CategoryMod> categoriesList = [];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: red[100],
                            offset: Offset(4,6),
                            blurRadius: 20
                        )
                      ],
                    ),
                    child: Padding(padding: EdgeInsets.all(4),
                      child: Image.asset("image/${categoriesList[index].image}", width: 50,),)
                ),
                SizedBox(height: 5,),
                CustomText(text: categoriesList[index].name, size: 16, color: black,)
              ],
            ),
          );
        },
      ),
    );
  }
}
