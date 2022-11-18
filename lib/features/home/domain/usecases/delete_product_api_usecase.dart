import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';

abstract class DeleteProductUsecase {
  Future<Either<ProductFailure, bool>> call(int index);
}

class DeleteProductsUsecaseImpl implements DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductsUsecaseImpl(this.repository);

  @override
  Future<Either<ProductFailure, bool>> call(int index) async {
    final eitherResponse = await repository.deleteProduct(index);

    return eitherResponse.fold(
      (failure) => left(failure),
      (sucess) => right(true),
    );
  }
}
