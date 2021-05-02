import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/models/products.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

import '../helpers/style.dart';
class ProductDetails extends StatefulWidget {
  final ProductsMod product;

  ProductDetails({@required this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      AssetImage('image/${widget.product.image}'),
                      AssetImage('image/${widget.product.image}'),
                      AssetImage('image/${widget.product.image}')
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: black,),
                        onPressed: (){Navigator.pop(context);},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset("image/cart.png", width: 30, height: 30,),

                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 5,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey,
                                          offset: Offset(2, 1),
                                          blurRadius: 3
                                      )
                                    ],
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4, right: 4),
                                    child: CustomText(text: "2", color: red, size: 18, weight: FontWeight.bold,),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 14,
                    bottom: 60,
                    child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: grey,
                              offset: Offset(2, 3),
                              blurRadius: 3
                            )
                          ]
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                            Icons.favorite,
                              size: 22,
                              color: red,
                            ),
                        )),
                  )
                ],
              ),
            ),
            CustomText(text: widget.product.name, size: 28, weight: FontWeight.bold,),
            CustomText(text: "\$" + widget.product.price.toString(), size: 18, weight: FontWeight.w600,),

            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.remove, size: 36, color: red[300],), onPressed: (){}),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30,12,30,12),
                      child: CustomText(text: "Add To Bag", color: white, size:24, weight: FontWeight.w600,),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.add, size: 36, color: red[300],), onPressed: (){}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
