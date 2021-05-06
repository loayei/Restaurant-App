import 'package:flutter/material.dart';

class AppProv with ChangeNotifier {
  bool isLoading = false;

  void LoadingSwitch(){
    isLoading = !isLoading;
    notifyListeners();
  }
}