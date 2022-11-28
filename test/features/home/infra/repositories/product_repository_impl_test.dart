import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/external/datasource/firebase_datasource_v2.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';
import 'package:products_challenge/features/home/infra/repositories/product_repository_impl.dart';

class ProductsDataSourceMock extends Mock implements ProductsDataSource {}

class FirestoreDataSourceMock extends Mock implements FirestoreDataSource {}

void main() {
  late FirestoreDataSourceMock firestoreMock;
  late ProductsDataSourceMock dataSourceMock;
  late ProductRepositoryImpl repository;

  setUp(() {
    firestoreMock = FirestoreDataSourceMock();
    dataSourceMock = ProductsDataSourceMock();
    repository = ProductRepositoryImpl(
      firestoreMock,
    );
  });

  group("getProducts |", () {
    test("Should return a [List<ProductModel> when call successful] |",
        () async {
      final productModel = ProductModel(
        id: 0,
        title: "title",
        categoryId: "categoryId",
        description: "description",
        imageUrl: "imageUrl",
        price: 100.5,
      );
      when(() => dataSourceMock.getProducts())
          .thenAnswer((_) async => right([productModel]));

      final result = await repository.getProducts();

      expect(result.fold(id, id), isA<List<ProductModel>>());
    });
    test("Should return a [DataSourceError] when call fails |", () async {
      when(() => dataSourceMock.getProducts()).thenThrow(Exception());

      final result = await repository.getProducts();

      expect(result.fold(id, id), isA<DataSourceError>());
    });
  });
}
