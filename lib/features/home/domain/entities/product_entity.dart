class ProductEntity {
  final int? id;
  final String categoryId;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  ProductEntity({
    this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}
