import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/providers/userAuth.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import 'package:provider/provider.dart';

class ShoppingCartScr extends StatefulWidget {
  @override
  _ShoppingCartScrState createState() => _ShoppingCartScrState();
}

class _ShoppingCartScrState extends State<ShoppingCartScr> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(
          text: "Shopping cart",
        ),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: user.userMod.cart.length,
          itemBuilder: (_, index) {
            List itemsCart = user.userMod.cart;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
               // width: MediaQuery.of(context).size.width - 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: red[200], offset: Offset(3, 4), blurRadius: 30)
                    ]),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        user.userMod.cart[index]["image"],
                        height: 90,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: user.userMod.cart[index]["name"] + "\n",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\$${user.userMod.cart[index]["price"]} \n",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: "Quantity: ",
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: user.userMod.cart[index]["quantity"].toString(),
                                style: TextStyle(
                                    color: red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ]),
                        ),
                        SizedBox(
                          width: 106,
                        ),
                        IconButton(icon: Icon(Icons.delete), onPressed: null)
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total: ",
                      style: TextStyle(
                          color: black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "\$4.55 \n",
                      style: TextStyle(
                          color: red,
                          fontSize: 21,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: red),
                child: FlatButton(
                  onPressed: () {},
                  child: CustomText(
                    text: "Pay",
                    color: white,
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
