import 'package:products_challenge/features/home/infra/models/product_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProducts();
}
