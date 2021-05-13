import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/order.dart';
import 'package:restaurants_app/assets/helpers/user.dart';
import 'package:restaurants_app/assets/models/order.dart';
import 'package:restaurants_app/assets/models/products.dart';
import 'package:restaurants_app/assets/models/user.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _fireStore = Firestore.instance;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserMod _userMod;

  //Getters are implemented below

  Status get status => _status;

  UserMod get userMod => _userMod;

  FirebaseUser get user => _user;

  List<OrderMod> orders = [];

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<void> signOut() {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _fireStore.collection('users').document(result.user.uid).setData({
          "name": name.text,
          "email": email.text,
          "id": result.user.uid,
          "likedFood": [],
          "likedRestaurants": []
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> insertToCart({ProductsMod product, int quantity}) async {
    try {
      var uuid = Uuid();
      String cartStuffId = uuid.v4();
  //    bool itemInCart = false;
      //prevent duplicates
      List cart = _userMod.cart;
      Map cartStuff = {
        "id": cartStuffId,
        "name": product.name,
        "image": product.image,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity,
      };
      //prevent duplicates by adding another count of the product to the cart
      //instead of a new item.
   //   for(Map item in cart){
    //    if (item["productId"] == cartStuff["productId"]) {
     //     item["quantity"] = item["quantity"] + quantity;
    //      itemInCart = true;
    //      break;
          //break the loop after checking
     //   }
   //   }
   //   if(!itemInCart) {
        //if item does not exist then simply add to cart
     //   _userMod.cart.add(cartStuff);
   //   }
      _userServices.insertToCart(userId: _user.uid, cartStuff: cartStuff);
      return true;
    } catch (e) {
      return false;
    }
  }

  getOrders()async{
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<bool> deleteFromCart({Map cartStuff}) async {
    try {

      _userServices.deleteFromCart(userId: _user.uid, cartStuff: cartStuff);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> refreshUserMod() async {
    _userMod = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userMod = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }

// Clear values from email password and name fields.
  void cleanControllers() {
    email.text = "";
    password.text = "";
    name.text = "";
  }
}
