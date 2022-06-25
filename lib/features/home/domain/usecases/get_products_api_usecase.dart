import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';

abstract class GetProductApiUseCase {
  final ProductRepository repository;

  GetProductApiUseCase(this.repository);

  Future<Either<ProductFailure, List<ProductEntity>>> call() async {
    return await repository.getProducts();
  }
}
