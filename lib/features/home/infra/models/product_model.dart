import 'dart:convert';

import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String? id,
    required String title,
    required String type,
    required String description,
    required String imageUrl,
    required double price,
    required int rating,
  }) : super(
          id: id,
          title: title,
          type: type,
          description: description,
          imageUrl: imageUrl,
          price: price,
          rating: rating,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating
    };
  }

  String toJson() => json.encode(toMap());

  static ProductModel fromMap(dynamic map, String id) {
    return ProductModel(
      id: id,
      title: map['title']?.toString() ?? "No title found",
      type: map['type']?.toString() ?? "No type found",
      description: map['description']?.toString() ?? "No description found",
      imageUrl: map['imageUrl']?.toString() ?? "No image found",
      price: double.tryParse(map['price'].toString()) ?? 0,
      rating: int.tryParse(map['rating'].toString()) ?? 0,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
        id: entity.id,
        title: entity.title,
        type: entity.type,
        description: entity.description,
        imageUrl: entity.imageUrl,
        price: entity.price,
        rating: entity.rating);
  }
}
