import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

abstract class ProductState {}

class ProductInitialState implements ProductState {}

class ProductLoadingState implements ProductState {}

class ProductSuccessState implements ProductState {
  final List<ProductEntity> products;

  ProductSuccessState(this.products);
}

class ProductFailureState implements ProductState {
  final String message;

  ProductFailureState(this.message);
}
