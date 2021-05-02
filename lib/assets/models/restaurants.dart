import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantMod {
  static const NAME = "name";
  static const ID = "id";
  static const AVERAGE_PRICE = "averagePrice";
  static const RATING = "rating";
  static const NO_OF_RATINGS = "noOfRatings";
  static const POPULAR = "popular";
  static const IMAGE = "image";

  String _name;
  String _id;
  double _averagePrice;
  double _rating;
  int _noOfRatings;
  bool _popular;
  String _image;

  //Getters are implemented below

  String get name => _name;

  String get id => _id;

  double get averagePrice => _averagePrice;

  double get rating => _rating;

  int get noOfRatings => _noOfRatings;

  bool get popular => _popular;

  String get image => _image;

  RestaurantMod.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _id = snapshot.data[ID];
    _averagePrice = snapshot.data[AVERAGE_PRICE];
    _rating = snapshot.data[RATING];
    _noOfRatings = snapshot.data[NO_OF_RATINGS];
    _popular = snapshot.data[POPULAR];
    _image = snapshot.data[IMAGE];
  }
}
