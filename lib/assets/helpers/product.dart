import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/products.dart';

class ProductServices {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<ProductsMod>> getProducts() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<ProductsMod> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductsMod.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductsMod>> getProductsByRestaurant({int id}) async =>
      _firestore
          .collection(collection)
          .where("restaurantId", isEqualTo: id)
          .getDocuments()
          .then((result) {
        List<ProductsMod> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductsMod.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductsMod>> getProductsByCategory({String category}) async =>
      _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .getDocuments()
          .then((result) {
        List<ProductsMod> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(ProductsMod.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductsMod>> searchProducts({String productName}) {
    String keyFind = productName[0].toUpperCase() + productName.substring(1);
    //Above code will ensure first character in search is always capital
    //since items usually start with a capital letter
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([keyFind])
        .endAt([keyFind + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<ProductsMod> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(ProductsMod.fromSnapshot(product));
          }
          return products;
        });
  }
}
