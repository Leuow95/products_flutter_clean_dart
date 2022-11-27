import 'dart:convert';

import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String? id,
    required String title,
    required String type,
    required String description,
    required String imageUrl,
    required String url,
    required double price,
  }) : super(
          id: id,
          title: title,
          type: type,
          description: description,
          imageUrl: imageUrl,
          url: url,
          price: price,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'url': url
    };
  }

  String toJson() => json.encode(toMap());

  static ProductModel fromJson(dynamic map) {
    return ProductModel(
      id: map["id"]?.toString() ?? "No id found",
      title: map['title']?.toString() ?? "No title found",
      type: map['type']?.toString() ?? "No type found",
      description: map['description']?.toString() ?? "No description found",
      imageUrl: map['imageUrl']?.toString() ?? "No image found",
      price: double.tryParse(map['price'].toString()) ?? 0,
      url: map['url']?.toString() ?? "No url found",
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
      url: entity.url,
    );
  }
}
