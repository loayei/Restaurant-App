import 'package:flutter/material.dart';
import '../models/category.dart';
import '../helpers/category.dart';

class CategoryProv with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryMod> categories = [];

  CategoryProv.initialize(){
    _startCategories();
  }

  _startCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}