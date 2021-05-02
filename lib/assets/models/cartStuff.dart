import 'package:cloud_firestore/cloud_firestore.dart';

class CartStuffMod {
  static const NAME = "name";
  static const IMAGE = "image";
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const NUMBER_OF_ITEMS = "numberOfItems";
  static const PRICE = "price";

  String _name;
  String _image;
  String _id;
  String _productId;
  double _price;
  int _numberOfItems;

  // Getters implemented below

  String get name => _name;

  String get image => _image;

  String get id => _id;

  String get productId => _productId;

  double get price => _price;

  int get numberOfItems => _numberOfItems;

  CartStuffMod.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _id = snapshot.data[ID];
    _productId = snapshot.data[PRODUCT_ID];
    _price = snapshot.data[PRICE];
    _numberOfItems = snapshot.data[NUMBER_OF_ITEMS];
  }
}
