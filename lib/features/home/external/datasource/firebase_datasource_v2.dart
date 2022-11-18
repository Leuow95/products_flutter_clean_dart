import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<bool> deleteProduct({required String id}) async {
    try {
      final db = FirebaseFirestore.instance;

      await db.collection("products").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
