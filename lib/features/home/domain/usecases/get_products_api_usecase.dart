import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';

abstract class GetProductApiUseCase {
  Future<Either<ProductFailure, List<ProductEntity>>> call();
}

class GetProductApiUseCaseImpl implements GetProductApiUseCase {
  final ProductRepository repository;

  GetProductApiUseCaseImpl(this.repository);

  @override
  Future<Either<ProductFailure, List<ProductEntity>>> call() async {
    
    final response = await repository.getProducts();
    return response;
  }
}
