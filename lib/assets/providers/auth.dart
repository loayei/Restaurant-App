import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/user.dart';
import 'package:restaurants_app/assets/models/user.dart';

enum Status{Uninitialized, Unauthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserMod _userMod;

  //Getters are implemented below

  Status get status => _status;
  UserMod get userMod => _userMod;
  FirebaseUser get user => _user;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      return true;
    } catch(e){
      return _onError(e.toString());
    }
  }

  Future<void> signOut(){
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((user){
        Map<String, dynamic> values = {
          "name": name.text,
          "email": email.text,
          "id": user.user.uid
      };
          _userServices.createUser(values);
        });
        return true;
    } catch(e) {
      return _onError(e.toString());
    }
  }

  Future<void> _onStateChanged(FirebaseUser firebaseUser) async{
    if(firebaseUser == null){
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userMod = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  // Methods used for above functions
  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("An error has occurred: $error");
    return false;
  }

  void cleanControllers(){
    email.text = "";
    password.text = "";
    name.text = "";
  }
}