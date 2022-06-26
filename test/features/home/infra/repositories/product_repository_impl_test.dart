import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_challenge/features/home/domain/errors/product_failure.dart';
import 'package:products_challenge/features/home/infra/datasources/products_datasource.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';
import 'package:products_challenge/features/home/infra/repositories/product_repository_impl.dart';

class ProductsDataSourceMock extends Mock implements ProductsDataSource {}

void main() {
  late ProductsDataSourceMock dataSourceMock;
  late ProductRepositoryImpl repository;

  setUp(() {
    dataSourceMock = ProductsDataSourceMock();
    repository = ProductRepositoryImpl(dataSourceMock);
  });

  group("getProducts |", () {
    test("Should return a [List<ProductModel> when call successful] |",
        () async {
      final productModel = ProductModel(
        title: "title",
        type: "type",
        description: "description",
        filename: "filename",
        height: 100,
        widht: 100,
        price: 100.5,
        rating: 4,
      );
      when(() => dataSourceMock.getProducts())
          .thenAnswer((_) async => [productModel]);

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
