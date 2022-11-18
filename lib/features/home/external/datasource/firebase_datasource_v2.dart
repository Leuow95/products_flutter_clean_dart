import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class FirestoreDataSource implements ProductsDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final db = FirebaseFirestore.instance;

      final data = await db.collection("products").get();

      final response = List.from(data.docs);

      return response.map((e) => ProductModel.fromMap(e)).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> deleteProduct(int index) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}
