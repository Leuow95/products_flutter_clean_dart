import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';

abstract class ProductRepository {
  Future<Either<ProductFailure, List<ProductEntity>>> getProducts();
  Future<Either<ProductFailure, bool>> deleteProduct({required String id});
}
