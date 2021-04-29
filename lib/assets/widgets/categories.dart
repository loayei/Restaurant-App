import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/models/foodcategory.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import '../helpers/style.dart';
import 'title.dart';

List<Category> categoriesList = [
  Category(name: "Salad", image: "salad.png"),
  Category(name: "Fast Food", image: "fastfood.png"),
  Category(name: "Drinks", image: "drinks.png"),
  Category(name: "Dessert", image: "dessert.png"),
  Category(name: "HotDogs", image: "hotdog.png"),
  Category(name: "Steak", image: "steak.png"),
];

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
