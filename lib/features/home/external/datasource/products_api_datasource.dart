import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';
import 'package:products_challenge/utils/datasource_constants.dart';

class ProductsApiDataSource implements ProductsDataSource {
  final Dio dio;

  ProductsApiDataSource(this.dio);

  @override
  Future<Either<DataSourceError, bool>> addProduct({
    required ProductModel productModel,
  }) async {
    try {
      await dio.post("${ApiConstants.baseUrl}${ApiConstants.baseUrl}",
          queryParameters: productModel.toJson());
      return right(true);
    } catch (e) {
      throw DataSourceError();
    }
  }

  @override
  Future<Either<DataSourceError, bool>> deleteProductById({
    required int id,
  }) async {
    try {
      await dio.delete("${ApiConstants.baseUrl}${ApiConstants.products}/$id",
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJuZXdAdXNlci5jb20iLCJpYXQiOjE2Njk1OTU1MDcsImV4cCI6MTY2OTYzMTUwN30.-tEjx4U9QPG9fa9qLtu8yHld9aR62nJXuSpJ6tVaGj8",
          }));
      return right(true);
    } catch (e) {
      throw left(DataSourceError());
    }
  }

  @override
  Future<Either<DataSourceError, List<ProductModel>>> getProducts() async {
    try {
      final response = await dio.get(
        ApiConstants.baseUrl + ApiConstants.products,
      );

      if (response.statusCode == 200) {
        final data = List.from(response.data["products"] as List);

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
