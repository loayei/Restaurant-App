import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsMod {
  static const NAME = "name";
  static const ID = "id";
  static const PRICE = "price";
  static const RATING = "rating";
  static const NO_OF_RATINGS = "noOfRatings";
  static const FEATURED = "featured";
  static const RESTAURANT = "restaurant";
  static const RESTAURANT_ID = "restaurantId";
  static const IMAGE = "image";
  static const CATEGORY = "category";

  String _name;
  String _id;
  double _price;
  double _rating;
  int _noOfRatings;
  bool _featured;
  String _image;
  String _restaurant;
  String _restaurantId;
  String _category;

  //Getters are implemented below

  String get name => _name;

  String get id => _id;

  double get price => _price;

  double get rating => _rating;

  int get noOfRatings => _noOfRatings;

  bool get featured => _featured;

  String get image => _image;

  String get restaurant => _restaurant;

  String get restaurantId => _restaurantId;

  String get category => _category;

  ProductsMod.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _id = snapshot.data[ID];
    _price = snapshot.data[PRICE];
    _rating = snapshot.data[RATING];
    _noOfRatings = snapshot.data[NO_OF_RATINGS];
    _featured = snapshot.data[FEATURED];
    _image = snapshot.data[IMAGE];
    _restaurant = snapshot.data[RESTAURANT];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _category = snapshot.data[CATEGORY];
  }
}
