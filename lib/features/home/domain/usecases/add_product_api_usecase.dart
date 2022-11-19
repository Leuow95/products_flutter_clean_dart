import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';

abstract class AddProductUsecase {
  Future<Either<ProductFailure, bool>> call({
    required ProductEntity productEntity,
  });
}

class AddProductUsecaseImpl implements AddProductUsecase {
  final ProductRepository repository;

  AddProductUsecaseImpl(this.repository);
  @override
  Future<Either<ProductFailure, bool>> call({
    required ProductEntity productEntity,
  }) async {
    final eitherResponse = await repository.addProduct(
      productEntity: productEntity,
    );

    return eitherResponse.fold(
      (failure) => left(failure),
      (success) => right(success),
    );
  }
}
