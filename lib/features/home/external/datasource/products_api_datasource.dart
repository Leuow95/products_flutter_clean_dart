import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class ProductsApiDataSource implements ProductsDataSource {
  final Dio dio;

  ProductsApiDataSource(this.dio);
  @override
  Future addImageProduct(String path) {
    // TODO: implement addImageProduct
    throw UnimplementedError();
  }

  @override
  Future<bool> addProduct({required ProductModel productModel}) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteProduct({required String id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<DataSourceError, List<ProductModel>>> getProducts() async {
    try {
      final response = await dio
          .get(ProductsApiConstants.baseUrl + ProductsApiConstants.products);

      if (response.statusCode == 200) {
        final data = List.from(response.data as List);

        final products = data.map((e) => ProductModel.fromJson(e)).toList();

        return right(products);
      }
      throw DataSourceError(message: response.statusMessage);
    } on DataSourceError catch (e) {
      return left(e);
    } catch (e) {
      throw left(DataSourceError());
    }
  }
}

class ProductsApiConstants {
  static const baseUrl = "http://52.67.196.41:8080";
  static const products = "/products";
}
