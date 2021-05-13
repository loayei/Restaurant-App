import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/models/order.dart';
import 'package:restaurants_app/assets/providers/userAuth.dart';
import 'package:restaurants_app/assets/providers/appLoading.dart';
import 'package:restaurants_app/assets/widgets/title.dart';

class OrdersScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  final user = Provider.of<UserProvider>(context);
  final app = Provider.of<AppProv>(context);
  return Scaffold(
    appBar: AppBar(
      iconTheme: IconThemeData(color: black),
      backgroundColor: white,
      elevation: 0.0,
      title: CustomText(text: "Orders"),
      leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    ),
    backgroundColor: white,
    body: ListView.builder(
        itemCount: user.orders.length,
        itemBuilder: (_, index){
          OrderMod _order = user.orders[index];
          return ListTile(
            leading: CustomText(
              text: "${_order.total}",
              weight: FontWeight.bold,
            ),
            title: Text(_order.description),
            subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.dateCreated).toString()),
            trailing: CustomText(text: _order.status, color: red,),
          );
        }),
  );
}
}