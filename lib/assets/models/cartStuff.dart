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
  int quantity;

  // Getters implemented below

  String get name => _name;

  String get image => _image;

  String get id => _id;

  String get productId => _productId;

  double get price => _price;

  int get numberOfItems => quantity;

  CartStuffMod.fromMap(Map data) {
    _name = data[NAME];
    _image = data[IMAGE];
    _id = data[ID];
    _productId = data[PRODUCT_ID];
    _price = data[PRICE];
    quantity = data[NUMBER_OF_ITEMS];
  }

  Map toMap() => {
        NAME: _name,
        IMAGE: _image,
        ID: _id,
        PRODUCT_ID: _productId,
        PRICE: _price,
        NUMBER_OF_ITEMS: quantity
      };
}
