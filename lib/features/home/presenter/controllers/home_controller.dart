import 'package:flutter/material.dart';
import 'package:products_challenge/features/home/domain/usecases/delete_product_api_usecase.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';
import 'package:products_challenge/features/home/presenter/controllers/state/products_state.dart';

class HomeController extends ValueNotifier<ProductState> {
  final GetProductApiUseCase getProductsUsecase;
  final DeleteProductUsecase deleteProductUsecase;

  HomeController({
    required this.getProductsUsecase,
    required this.deleteProductUsecase,
  }) : super(ProductInitialState());

  Future<void> fetchProducts() async {
    value = ProductLoadingState();

    var products = await getProductsUsecase.call();

    products.fold(
      (failure) => value = ProductFailureState(value.toString()),
      (products) => value = ProductSuccessState(products),
    );
  }

  Future<void> deleteProductByIndex(int index) async {
    value = ProductLoadingState();

    final eitherResponse = await deleteProductUsecase.call(index);

    eitherResponse.fold(
      (failure) => value = ProductFailureState(failure.toString()),
      (success) => fetchProducts(),
    );
  }
}
