import 'package:flutter_test/flutter_test.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

void main() {
  group("ProductModel |", () {
    test("toMap", () {
      final ProductModel productModel = ProductModel(
        id: 0,
        title: "title",
        categoryId: "categoryId",
        description: "description",
        imageUrl: "imageUrl",
        price: 100.5,
      );

      Map<String, dynamic> map = productModel.toJson();

      expect(map["title"], "title");
      expect(map["type"], "type");
      expect(map["description"], "description");
      expect(map["filename"], "filename");
      expect(map["height"], 100);
      expect(map["width"], 50);
      expect(map["price"], 100.5);
      expect(map["url"], "url");
    });

    test("fromMap success", () {
      final json = {
        "id": 0,
        "name": "title",
        "categoryId": "type",
        "description": "description",
        "price": 100.5,
      };

      final ProductModel productModel = ProductModel.fromJson(json);
      expect(productModel.name, "title");
      expect(productModel.categoryId, "type");
      expect(productModel.description, "description");
      expect(productModel.imageUrl, "filename");

      expect(productModel.price, 100.5);
    });

    test("fromMap error", () {
      final json = {"teste": ""};

      final ProductModel productModel = ProductModel.fromJson(json);
      expect(productModel.name, "No title found");
      expect(productModel.categoryId, "No type found");
      expect(productModel.description, "No description found");
      expect(productModel.imageUrl, "");
      expect(productModel.price, 0);
    });

    test("fromMap error2", () {
      final json = {
        "price": "abc",
        "title": 10.5,
      };

      final ProductModel productModel = ProductModel.fromJson(
        json,
      );
      expect(productModel.id, "No id found");
      expect(productModel.name, 10.5.toString());
      expect(productModel.categoryId, "No categoryId found");
      expect(productModel.description, "No description found");
      expect(productModel.imageUrl, "");
      expect(productModel.price, 0);
    });
  });
}
