import 'dart:convert';

import 'package:products_challenge/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String title,
    required String type,
    required String description,
    required String filename,
    required int height,
    required int widht,
    required double price,
    required int rating,
  }) : super(
          title: title,
          type: type,
          description: description,
          filename: filename,
          height: height,
          widht: widht,
          price: price,
          rating: rating,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'height': height,
      'widht': widht,
      'price': price,
      'rating': rating
    };
  }

  String toJson() => json.encode(toMap());

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'],
      type: map['type'],
      description: map['description'],
      filename: map['filename'],
      height: map['height'],
      widht: map['widht'],
      price: map['price'],
      rating: map['rating'],
    );
  }

  static ProductModel fromJson(String source) => fromMap(json.decode(source));
}
