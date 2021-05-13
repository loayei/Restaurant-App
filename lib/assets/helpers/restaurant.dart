import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurants.dart';

class RestaurantServices {
  String collection = "restaurants";
  Firestore _firestore = Firestore.instance;

  Future<List<RestaurantMod>> getRestaurants() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<RestaurantMod> restaurants = [];
        for (DocumentSnapshot restaurant in result.documents) {
          restaurants.add(RestaurantMod.fromSnapshot(restaurant));
        }
        return restaurants;
      });

  Future<List<RestaurantMod>> searchRestaurants({String restaurantName}) {
    String keyFind =
        restaurantName[0].toUpperCase() + restaurantName.substring(1);
    //Above code will ensure first character in search is always capital
    //since items usually start with a capital letter
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([keyFind])
        .endAt([keyFind + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<RestaurantMod> restaurants = [];
          for (DocumentSnapshot restaurant in result.documents) {
            restaurants.add(RestaurantMod.fromSnapshot(restaurant));
          }
          return restaurants;
        });
  }
}
