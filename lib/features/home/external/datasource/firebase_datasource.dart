import 'package:firebase_database/firebase_database.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class FirebaseDataSource implements ProductsDataSource {
  final DatabaseReference database;

  FirebaseDataSource(this.database);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final List<ProductModel> list = [];
      final DataSnapshot dataSnapshot = await database.get();

      final jsonObject = List?.from(dataSnapshot.value as List);

      // ignore: avoid_function_literals_in_foreach_calls
      jsonObject.forEach((element) {
        if (element != null) {
          list.add(ProductModel.fromMap(element));
        }
      });

      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> deleteProduct(int index) async {
    try {
      final ref = FirebaseDatabase.instance.ref();
      ref.child("/$index").remove();
      return true;
    } catch (e) {
      return false;
    }
  }
}
