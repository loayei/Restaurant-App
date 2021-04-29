import 'package:cloud_firestore/cloud_firestore.dart';

class UserMod{
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";

  String _name;
  String _email;
  String _id;

  // Getters implemented below

  String get name => _name;
  String get email => _email;
  String get id => _id;

  UserMod.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
  }
}