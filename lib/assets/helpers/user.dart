import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurants_app/assets/models/user.dart';

class UserServices{
  String collection = "users";
  Firestore _firestore = Firestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    _firestore.collection(collection).document(values['id']).setData(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    _firestore.collection(collection).document(values['id']).updateData(values);
  }

  void insertToCart({String userId, Map cartStuff}) {
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartStuff])
    });
  }

  Future<UserMod> getUserById(String id) => _firestore.collection(collection).document(id).get().then((doc){
    return UserMod.fromSnapshot(doc);
  });
}