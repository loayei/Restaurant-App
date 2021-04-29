import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurants_app/assets/models/user.dart';

enum Status{Uninitialized, Unauthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  Firestore _firestore = Firestore.instance;
  UserServices _userServices = UserServices();
  UserMod _userMod;

  //Getters are implemented below

Status get status => _status;
FirebaseUser get user => _user;
}