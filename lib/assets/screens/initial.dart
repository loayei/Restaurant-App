import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/widgets/bottom_bar_icons.dart';
import 'package:restaurants_app/assets/widgets/categories.dart';
import 'package:restaurants_app/assets/widgets/favorite_button.dart';
import 'package:restaurants_app/assets/widgets/featured_products.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

import 'cart.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "What are you looking for?",
                      size: 18,
                    )),
                Stack(
                  children: [
                    IconButton(
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                      color: grey[500], offset: Offset(5, 2), blurRadius: 15)
                ]),
                child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: red,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Search for food or restaurant",
                          border: InputBorder.none),
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured",
                size: 20,
                color: grey,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                size: 20,
                color: grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "image/salad.png",
                            width: 400,
                            height: 200,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FavoriteButton(Icons.favorite),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow[900],
                                      size: 20,
                                    ),
                                  ),
                                  Text("4.5")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              ),
                            ),
                          ))),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Salad \n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: white)),
                            TextSpan(
                                text: "by: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: white)),
                            TextSpan(
                                text: "CheeseCake Factory",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: white)),
                          ], style: TextStyle(color: black))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "\$12.99 \n",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: white))
                          ], style: TextStyle(color: black))),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 62,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomBarIcon(
                image: "home.png",
                name: "Home"
            ),
            BottomBarIcon(
                image: "nearby.png",
                name: "Map"
            ),
            BottomBarIcon(
              onTap: (){
                changeScreen(context, ShoppingCart());
              },
              image: "cart.png",
              name: "Cart"
            ),
            BottomBarIcon(
                image: "profile.png",
                name: "Profile"
            ),
                ],
              ),
            ),
        );

  }
}
