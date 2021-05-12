import 'package:flutter/material.dart';

class AppProv with ChangeNotifier {
  bool isLoading = false;
  double totalPrice = 0;
  double priceSum = 0;
  int totalQuantity = 0;

  void loadingSwitch() {
    isLoading = !isLoading;
    notifyListeners();
  }

  addPrice({int newPrice}) {
    priceSum += newPrice;
    notifyListeners();
  }

  addQuantity({int newQuantity}) {
    newQuantity += newQuantity;
    notifyListeners();
  }

  getTotalPrice() {
    totalPrice = priceSum * totalQuantity;
    notifyListeners();
  }
}
