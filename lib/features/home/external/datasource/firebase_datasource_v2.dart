import 'dart:io';

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

  @override
  Future addImageProduct(String path) async {
    File file = File(path);
    try {
      String ref = "products/img-${DateTime.now().toString()}.jpeg";
      final storageRef = FirebaseStorage.instance.ref();
      await storageRef.child(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception("Error during try to upload: ${e.toString()}");
    }
  }

  Future<String> getImageProduct(String url) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();

      final imagesRef = storageRef.child("products");

      return await storageRef.getDownloadURL();
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
