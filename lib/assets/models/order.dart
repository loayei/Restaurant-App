import 'package:cloud_firestore/cloud_firestore.dart';

class OrderMod {
  static const DESCRIPTION = "description";
  static const ID = "id";
  static const AMOUNT = "amount";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const DATE_CREATED = "dateCreated";
  static const STATUS = "status";

  String _description;
  String _id;
  double _amount;
  String _productId;
  String _userId;
  int _dateCreated;
  String _status;

  //Getters are implemented below

  String get description => _description;

  String get id => _id;

  double get price => _amount;

  String get productId => _productId;

  String get userId => _userId;

  int get dateCreated => _dateCreated;

  String get status => _status;

  OrderMod.fromSnapshot(DocumentSnapshot snapshot) {
    _description = snapshot.data[DESCRIPTION];
    _id = snapshot.data[ID];
    _amount = snapshot.data[AMOUNT];
    _productId = snapshot.data[PRODUCT_ID];
    _userId = snapshot.data[USER_ID];
    _dateCreated = snapshot.data[DATE_CREATED];
    _status = snapshot.data[STATUS];
  }
}
