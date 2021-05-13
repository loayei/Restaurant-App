import 'package:flutter/material.dart';
import '../models/products.dart';
import '../helpers/product.dart';

class ProductProv with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductsMod> products = [];
  List<ProductsMod> productsByCategory = [];
  List<ProductsMod> productsByRestaurant = [];
  List<ProductsMod> itemsSearched = [];

  ProductProv.initialize(){
    _startProducts();
  }

  _startProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }
  Future startProductsByCategory({String categoryName})async{
    productsByCategory = await _productServices.getProductsByCategory(category: categoryName);
    notifyListeners();
  }

  Future startProductsByRestaurant({int restaurantId})async{
    productsByRestaurant = await _productServices.getProductsByRestaurant(id: restaurantId);
    notifyListeners();
  }

  Future search({String productName}) async {
    itemsSearched = await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}