import 'package:products_challenge/features/home/infra/models/product_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProducts();
  Future<bool> deleteProduct({required String id});
  Future<bool> addProduct({required ProductModel productModel});
  Future addImageProduct(String path);
}
