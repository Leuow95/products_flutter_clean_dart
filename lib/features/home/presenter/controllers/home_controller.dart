import 'package:flutter/material.dart';
import 'package:products_challenge/features/home/domain/entities/product_entity.dart';
import 'package:products_challenge/features/home/domain/usecases/add_product_api_usecase.dart';
import 'package:products_challenge/features/home/domain/usecases/delete_product_api_usecase.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';
import 'package:products_challenge/features/home/presenter/controllers/state/products_state.dart';
import 'package:products_challenge/features/home/presenter/params/add_products_params.dart';

class HomeController extends ValueNotifier<ProductState> {
  final GetProductApiUseCase getProductsUsecase;
  final DeleteProductUsecase deleteProductUsecase;
  final AddProductUsecase addProductUsecase;

  HomeController({
    required this.getProductsUsecase,
    required this.deleteProductUsecase,
    required this.addProductUsecase,
  }) : super(ProductInitialState());

  Future<void> fetchProducts() async {
    value = ProductLoadingState();

    var products = await getProductsUsecase.call();

    products.fold(
      (failure) => value = ProductFailureState(value.toString()),
      (products) => value = ProductSuccessState(products),
    );
  }

  Future<void> deleteProductByIndex({required String id}) async {
    value = ProductLoadingState();

    final eitherResponse = await deleteProductUsecase.call(id: id);

    eitherResponse.fold(
      (failure) => value = ProductFailureState(failure.toString()),
      (success) => fetchProducts(),
    );
  }

  Future<void> addProduct({
    required AddProductsParams params,
  }) async {
    value = ProductLoadingState();

    final eitherResponse = await addProductUsecase.call(
      productEntity: ProductEntity(
          id: null,
          title: params.title,
          type: params.type,
          description: params.description,
          filename: params.filename,
          height: params.height,
          width: params.width,
          price: params.price,
          rating: params.rating),
    );

    eitherResponse.fold(
      (failure) => value = ProductFailureState(failure.toString()),
      (success) => value = AddProductSuccessState(),
    );
  }
}
