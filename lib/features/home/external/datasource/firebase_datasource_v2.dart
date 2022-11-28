import 'package:dartz/dartz.dart';
import '../../domain/errors/product_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';

class FirestoreDataSource implements ProductsDataSource {
  @override
  Future<Either<DataSourceError, List<ProductModel>>> getProducts() async {
    try {
      final db = FirebaseFirestore.instance;

      final data = await db.collection("products").get();

      return right(
          data.docs.map((e) => ProductModel.fromJson(e.data())).toList());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<DataSourceError, bool>> deleteProductById(
      {required int id}) async {
    try {
      final db = FirebaseFirestore.instance;

      await db.collection("products").doc(id.toString()).delete();
      return right(true);
    } catch (e) {
      return left(DataSourceError());
    }
  }

  @override
  Future<Either<DataSourceError, bool>> addProduct(
      {required ProductModel productModel}) async {
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

      await db.collection("products").add(productModel.toJson());
      // await db.collection("products").add(item2);
      return right(true);
    } catch (e) {
      return left(DataSourceError());
    }
  }
}
