import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryMod {
  static const NAME = "name";
  static const IMAGE = "image";
  static const ID = "id";

  String _name;
  String _image;
  String _id;

  // Getters implemented below

  String get name => _name;

  String get image => _image;

  String get id => _id;

  CategoryMod.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _id = snapshot.data[ID];
  }
}
