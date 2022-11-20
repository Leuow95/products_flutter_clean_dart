import 'dart:convert';

import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String? id,
    required String title,
    required String type,
    required String description,
    required String filename,
    required int height,
    required int width,
    required double price,
    required int rating,
  }) : super(
          id: id,
          title: title,
          type: type,
          description: description,
          filename: filename,
          height: height,
          width: width,
          price: price,
          rating: rating,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'height': height,
      'width': width,
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
      filename: map['filename']?.toString() ?? "",
      height: int.tryParse(map['height'].toString()) ?? 0,
      width: int.tryParse(map['width'].toString()) ?? 0,
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
        filename: entity.filename,
        height: entity.height,
        width: entity.width,
        price: entity.price,
        rating: entity.rating);
  }
}
