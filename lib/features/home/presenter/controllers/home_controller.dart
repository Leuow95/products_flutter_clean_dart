import 'package:flutter/material.dart';
import 'package:products_challenge/features/home/domain/usecases/get_products_api_usecase.dart';
import 'package:products_challenge/features/home/presenter/controllers/state/products_state.dart';

class HomeController extends ValueNotifier<ProductState> {
  final GetProductApiUseCase getProductsUsecase;

  HomeController({required this.getProductsUsecase})
      : super(ProductInitialState());

  Future<void> fetchProducts() async {
    value = ProductLoadingState();

    final products = await getProductsUsecase.call();

    products.fold(
      (failure) => value = ProductFailureState(value.toString()),
      (products) => value = ProductSuccessState(products),
    );
  }
}
