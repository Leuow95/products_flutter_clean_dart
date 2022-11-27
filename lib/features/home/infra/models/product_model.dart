import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int? id,
    required String title,
    required String categoryId,
    required String description,
    required String imageUrl,
    required double price,
  }) : super(
          id: id,
          name: title,
          categoryId: categoryId,
          description: description,
          imageUrl: imageUrl,
          price: price,
        );

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'productName': name,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'description': description,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      categoryId: categoryId,
      description: description,
    );
  }

  static ProductModel fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: int.tryParse(map["id"].toString()) ?? -1,
      title: map['name']?.toString() ?? "No title found",
      categoryId: map['category']?.toString() ?? "No category found",
      description: map['description']?.toString() ?? "No description found",
      imageUrl: map['image']?.toString() ?? "No image found",
      price: double.tryParse(map['price'].toString()) ?? 0,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.name,
      categoryId: entity.categoryId,
      description: entity.description,
      imageUrl: entity.imageUrl,
      price: entity.price,
    );
  }
}
