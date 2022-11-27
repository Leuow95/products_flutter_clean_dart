import 'package:dartz/dartz.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';

abstract class DeleteProductUsecase {
  Future<Either<ProductFailure, bool>> call({required int id});
}

class DeleteProductsUsecaseImpl implements DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductsUsecaseImpl(this.repository);

  @override
  Future<Either<ProductFailure, bool>> call({required int id}) async {
    final eitherResponse = await repository.deleteProduct(id: id);

    return eitherResponse.fold(
      (failure) => left(failure),
      (sucess) => right(true),
    );
  }
}
