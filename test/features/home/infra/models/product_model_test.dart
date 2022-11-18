import 'package:flutter_test/flutter_test.dart';
import 'package:products_challenge/features/home/infra/models/product_model.dart';

void main() {
  group("ProductModel |", () {
    test("toMap", () {
      final ProductModel productModel = ProductModel(
        id: "id",
        title: "title",
        type: "type",
        description: "description",
        filename: "filename",
        height: 100,
        width: 50,
        price: 100.5,
        rating: 4,
      );

      Map<String, dynamic> map = productModel.toMap();

      expect(map["title"], "title");
      expect(map["type"], "type");
      expect(map["description"], "description");
      expect(map["filename"], "filename");
      expect(map["height"], 100);
      expect(map["width"], 50);
      expect(map["price"], 100.5);
      expect(map["rating"], 4);
    });

    test("fromMap success", () {
      final json = {
        "id": "idfromapp",
        "title": "title",
        "type": "type",
        "description": "description",
        "filename": "filename",
        "height": 100,
        "width": 50,
        "price": 100.5,
        "rating": 4,
      };

      final ProductModel productModel =
          ProductModel.fromMap(json, json["id"].toString());
      expect(productModel.title, "title");
      expect(productModel.type, "type");
      expect(productModel.description, "description");
      expect(productModel.filename, "filename");
      expect(productModel.height, 100);
      expect(productModel.width, 50);
      expect(productModel.price, 100.5);
      expect(productModel.rating, 4);
    });

    test("fromMap error", () {
      final json = {"teste": ""};

      final ProductModel productModel =
          ProductModel.fromMap(json, json["id"].toString());
      expect(productModel.title, "No title found");
      expect(productModel.type, "No type found");
      expect(productModel.description, "No description found");
      expect(productModel.filename, "");
      expect(productModel.height, 0);
      expect(productModel.width, 0);
      expect(productModel.price, 0);
      expect(productModel.rating, 0);
    });

    test("fromMap error2", () {
      final json = {
        "price": "abc",
        "title": 10.5,
      };

      final ProductModel productModel =
          ProductModel.fromMap(json, json["id"].toString());
      expect(productModel.title, 10.5.toString());
      expect(productModel.type, "No type found");
      expect(productModel.description, "No description found");
      expect(productModel.filename, "");
      expect(productModel.height, 0);
      expect(productModel.width, 0);
      expect(productModel.price, 0);
      expect(productModel.rating, 0);
    });
  });
}
