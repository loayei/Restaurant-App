import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';

class CategoryServices {
  String collection = "categories";
  Firestore _firestore = Firestore.instance;

  Future<List<CategoryMod>> getCategories() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<CategoryMod> categories = [];
        for(DocumentSnapshot category in result.documents){
          categories.add(CategoryMod.fromSnapshot(category));
        }
        return categories;
      });
}