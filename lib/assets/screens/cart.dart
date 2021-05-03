import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: black,), onPressed: null),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Cart",),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top:9),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset("image/cart.png", width: 30, height: 20,),
                ),
                Positioned(
                  bottom: 7,
                  right: 5,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: grey[400],
                              offset: Offset(2, 1),
                              blurRadius: 3
                          )
                        ],
                        color: white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: CustomText(text: "2", color: red, size: 16, weight: FontWeight.bold,),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
     /*
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: red[200],
                    offset: Offset(3, 4),
                    blurRadius: 30
                  )
                ]
              ),
              child: Row(
                children: [
                  Image.asset(
                    "image/${product.image}",
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(children: [
                        TextSpan(text: product.name + "\n", style: TextStyle(color: black, fontSize: 20)),
                        TextSpan(text: "\$" + product.price.toString(), style: TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.bold))
                      ]),),
                      SizedBox(
                        width: 136,
                      ),
                      IconButton(icon: Icon(Icons.delete), onPressed: null)
                    ],
                  )
                ],
              ),
            ),
          ),

      */
        ],
      ),
    );
  }
}
