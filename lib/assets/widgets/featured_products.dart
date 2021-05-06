import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/screens/productDetails.dart';
import 'package:transparent_image/transparent_image.dart';
import '../providers/products.dart';
import '../helpers/style.dart';
import 'loading.dart';
import 'title.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProv = Provider.of<ProductProv>(context);
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productProv.products.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        ProductDetails(
                          product: productProv.products[index],
                        ));
                  },
                  child: Container(
                    height: 220,
                    width: 200,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: red[100],
                              offset: Offset(15, 5),
                              blurRadius: 25)
                        ]),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              )),
                              Center(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: productProv.products[index].image,
                                  height: 126,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: productProv.products[index].name,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CustomText(
                                    text: productProv.products[index].rating
                                        .toString(),
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
                                text: "\$${productProv.products[index].price}",
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
