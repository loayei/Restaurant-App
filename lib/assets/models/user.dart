import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurants_app/assets/models/cartStuff.dart';

class UserMod {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";

  String _name;
  String _email;
  String _id;
  String _stripeId;
  List cart;

  // Getters implemented below

  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get stripeId => _stripeId;

  UserMod.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    _stripeId = snapshot.data[STRIPE_ID];
    cart = snapshot.data[CART] ?? [];
  }

/*
  List<CartStuffMod> _changeCartItems(List<Map> cart) {
    //getting cart items and storing them in the database as a list of Maps
    //then converting them into cart models.
    List<CartStuffMod> changedCart = [];
    for (Map cartItem in cart) {
      changedCart.add(CartStuffMod.fromMap(cartItem));
    }
    return changedCart;
  }

   */
}
