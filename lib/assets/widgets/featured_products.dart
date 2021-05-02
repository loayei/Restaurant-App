import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/models/products.dart';
import 'package:restaurants_app/assets/screens/productDetails.dart';
import '../helpers/style.dart';
import 'title.dart';

List<ProductsMod> productsList =[];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(12,14,16,12),
                child: GestureDetector(
                  onTap: (){
                    changeScreen(_, ProductDetails(product: productsList[index],));
                  },
                  child: Container(
                    height: 220,
                    width: 200,
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: red[100],
                          offset: Offset(15, 5),
                          blurRadius: 25)
                    ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "image/${productsList[index].image}",
                          height: 140,
                          width: 140,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(text: productsList[index].name),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey[500],
                                          offset: Offset(1, 1),
                                          blurRadius: 4)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                  Icons.favorite_border,
                                  color: red,
                                  size: 18,
                                )
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: productsList[index].rating.toString(),
                                    color: grey,
                                    size: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 16,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: CustomText(
                                text: "\$${productsList[index].price}",
                                weight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

