import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/repositories/product_repository.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';

class ProductRepositoryMock extends Mock implements ProductRepository {}

void main() {
  late final ProductRepositoryMock repository;
  late final GetProductApiUseCaseImpl useCase;

  setUp(() {
    repository = ProductRepositoryMock();
    useCase = GetProductApiUseCaseImpl(repository);
  });

  group("getProductsUseCase |", () {
    test("Should return a [List<ProductsEntity>] if successful", () async {
      final entity = ProductEntity(
        id: 1,
        name: "name",
        categoryId: "cagegoryId",
        description: "description",
        imageUrl: "imageUrl",
        price: 100.5,
      );
      when(() => repository.getProducts())
          .thenAnswer((_) async => Right([entity]));

      final result = await useCase();

      expect(result.fold(id, id), isA<List<ProductEntity>>());
    });
  });
}
