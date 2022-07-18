import 'package:firebase_database/firebase_database.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class FirebaseDataSource implements ProductsDataSource {
  final DatabaseReference database;

  FirebaseDataSource(this.database);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final DataSnapshot dataSnapshot = await database.get();

      final jsonObject = List?.from(dataSnapshot.value as List);

      final jsonValue = jsonObject;
      final list = (jsonValue).map((e) => ProductModel.fromMap(e)).toList();

      return list;
    } catch (e) {
      return [];
    }
  }
}
