import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

abstract class ProductsDataSource {
  Future<Either<DataSourceError, List<ProductModel>>> getProducts();
  Future<Either<DataSourceError, bool>> deleteProductById({required int id});
  Future<Either<DataSourceError, bool>> addProduct({
    required ProductModel productModel,
  });
}
