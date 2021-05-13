import 'package:cloud_firestore/cloud_firestore.dart';

class OrderMod {
  static const DESCRIPTION = "description";
  static const ID = "id";
  static const TOTAL = "total";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const DATE_CREATED = "dateCreated";
  static const STATUS = "status";
  static const RESTAURANT_ID = "restaurantId";

  String _description;
  String _id;
  double _total;
  String _cart;
  String _userId;
  int _dateCreated;
  String _status;
  String _restaurantId;

  //Getters are implemented below

  String get description => _description;

  String get id => _id;

  double get total => _total;

  String get cart => _cart;

  String get userId => _userId;

  int get dateCreated => _dateCreated;

  String get status => _status;

  String get restaurantId => _restaurantId;


  OrderMod.fromSnapshot(DocumentSnapshot snapshot) {
    _description = snapshot.data[DESCRIPTION];
    _id = snapshot.data[ID];
    _total = snapshot.data[TOTAL];
    _cart = snapshot.data[CART];
    _userId = snapshot.data[USER_ID];
    _dateCreated = snapshot.data[DATE_CREATED];
    _status = snapshot.data[STATUS];
    _restaurantId = snapshot.data[RESTAURANT_ID];
  }
}
