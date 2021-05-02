import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/providers/auth.dart';
import 'package:restaurants_app/assets/widgets/favorite_button.dart';
import 'package:restaurants_app/assets/widgets/featured_products.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: black,
        title: CustomText(
          text: "RestaurantApp",
          color: white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  changeScreen(context, ShoppingCart());
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: red, borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.notifications_outlined), onPressed: () {}),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: red, borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: black,
                ),
                accountName: CustomText(
                  text: authProvider.userMod?.name,
                  color: white,
                  weight: FontWeight.bold,
                  size: 18,
                ),
                accountEmail: CustomText(
                  text: authProvider.userMod?.email,
                  color: grey,
                )),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home_outlined),
              title: CustomText(
                text: "Home",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.fastfood_outlined),
              title: CustomText(
                text: "Liked Food",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.restaurant_menu_outlined),
              title: CustomText(
                text: "Liked Restaurants",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark_border_outlined),
              title: CustomText(
                text: "Order History",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart_outlined),
              title: CustomText(
                text: "Cart",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings_outlined),
              title: CustomText(
                text: "Settings",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("image/salad.png")),
                        ),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Indian",
                                  color: white,
                                  size: 26,
                                  weight: FontWeight.w300,
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("image/salad.png")),
                        ),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Italian",
                                  color: white,
                                  size: 26,
                                  weight: FontWeight.w300,
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("image/salad.png")),
                        ),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Indian",
                                  color: white,
                                  size: 26,
                                  weight: FontWeight.w300,
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("image/salad.png")),
                        ),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Indian",
                                  color: white,
                                  size: 26,
                                  weight: FontWeight.w300,
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 140,
                          height: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("image/salad.png")),
                        ),
                        Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Indian",
                                  color: white,
                                  size: 26,
                                  weight: FontWeight.w300,
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Featured",
                    size: 20,
                    color: grey,
                  ),
                  CustomText(
                    text: "see all",
                    size: 14,
                    color: black,
                  ),
                ],
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Popular restaurants",
                    size: 20,
                    color: grey,
                  ),
                  CustomText(
                    text: "see all",
                    size: 14,
                    color: black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("image/salad.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FavoriteButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.purple[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
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
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          )),
                    ),
                  )),
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
                                  text: "Santos Tacho \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "avg meal price: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "\$5.99 \n",
                                  style: TextStyle(fontSize: 16)),
                            ], style: TextStyle(color: white)),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("image/salad.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FavoriteButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.purple[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
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
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          )),
                    ),
                  )),
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
                                  text: "Santos Tacho \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "avg meal price: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "\$5.99 \n",
                                  style: TextStyle(fontSize: 16)),
                            ], style: TextStyle(color: white)),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("image/salad.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FavoriteButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.purple[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
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
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          )),
                    ),
                  )),
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
                                  text: "Santos Tacho \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "avg meal price: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "\$5.99 \n",
                                  style: TextStyle(fontSize: 16)),
                            ], style: TextStyle(color: white)),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
