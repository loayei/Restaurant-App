import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurants_app/assets/models/cartStuff.dart';
import 'package:restaurants_app/assets/models/order.dart';

class OrderServices{
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId ,String id,String description,String status ,List<CartStuffMod> cart, double totalPrice}) {
    List<Map> convertedCart = [];
    List<String> restaurantIds = [];

    for(CartStuffMod item in cart){
      convertedCart.add(item.toMap());
      restaurantIds.add(item.restaurantId);
    }


    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "restaurantIds": restaurantIds,
      "cart": convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status
    });
  }

  Future<List<OrderMod>> getUserOrders({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderMod> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderMod.fromSnapshot(order));
        }
        return orders;
      });

}