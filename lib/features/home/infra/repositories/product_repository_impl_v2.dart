import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';
import 'package:products_challenge/features/home/external/datasource/products_api_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

class ProductRepositoryImplV2 implements ProductRepository {
  final ProductsApiDataSource dataSource;

  ProductRepositoryImplV2(this.dataSource);

  @override
  Future<Either<ProductFailure, List<ProductEntity>>> getProducts() async {
    try {
      final eitherResponse = await dataSource.getProducts();

      return eitherResponse.fold(
        (failure) => left(failure),
        (products) => right(products),
      );
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return left(DataSourceError());
    }
  }

  @override
  Future<Either<ProductFailure, bool>> deleteProduct({required int id}) async {
    try {
      await dataSource.deleteProductById(id: id);
      return right(true);
    } on DataSourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DataSourceError());
    }
  }

  @override
  Future<Either<ProductFailure, bool>> addProduct({
    required ProductEntity productEntity,
  }) async {
    try {
      await dataSource.addProduct(
          productModel: ProductModel.fromEntity(productEntity));

      return right(true);
    } on DataSourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DataSourceError());
    }
  }
}
