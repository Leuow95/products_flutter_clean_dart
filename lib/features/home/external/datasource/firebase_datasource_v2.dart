import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class FirestoreDataSource implements ProductsDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final db = FirebaseFirestore.instance;

      final data = await db.collection("products").get();

      return data.docs
          .map((e) => ProductModel.fromMap(e.data(), e.id))
          .toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<String> getImageProduct(String url) async {
    try {
      final storageImage = FirebaseStorage.instance
          .ref()
          .child("gs://products-challenge-ca64d.appspot.com/products/$url");

      return await storageImage.getDownloadURL();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<bool> deleteProduct({required String id}) async {
    try {
      final db = FirebaseFirestore.instance;

      await db.collection("products").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addProduct({required ProductModel productModel}) async {
    // const item2 = {
    //   "title": "Sweet fresh stawberry",
    //   "type": "fruit",
    //   "description": "Sweet fresh stawberry on the wooden table",
    //   "filename": "1.jpg",
    //   "height": 450,
    //   "width": 299,
    //   "price": 29.45,
    //   "rating": 4
    // };

    try {
      final db = FirebaseFirestore.instance;

      await db.collection("products").add(productModel.toMap());
      // await db.collection("products").add(item2);
      return true;
    } catch (e) {
      return false;
    }
  }
}
