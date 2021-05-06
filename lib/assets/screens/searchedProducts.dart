import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/assets/providers/products.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/widgets/products.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

class SearchedProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProv = Provider.of<ProductProv>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){
          Navigator.pop(context);
        },),
        title: CustomText(text: "Items", size: 20,),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: (){})
        ],
      ),
      body: productProv.itemsSearched.length < 1 ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_outlined, color: grey, size: 30,),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "This product is not available", color: grey, weight: FontWeight.w300, size: 26,),
            ],
          )
        ],
      ) : ListView.builder(
          itemCount: productProv.itemsSearched.length,
          itemBuilder: (context, index){
            return ProductWidget(product: productProv.itemsSearched[index],);
          }),
    );
  }
}
