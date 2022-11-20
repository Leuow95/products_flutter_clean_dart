import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<ProductFailure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await dataSource.getProducts();

      return Right(response);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }

  @override
  Future<Either<ProductFailure, bool>> deleteProduct(
      {required String id}) async {
    try {
      await dataSource.deleteProduct(id: id);
      return right(true);
    } on DataSourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DataSourceError());
    }
  }

  @override
  Future<Either<ProductFailure, bool>> addProduct(
      {required ProductEntity productEntity}) {
    throw UnimplementedError();
  }
}
