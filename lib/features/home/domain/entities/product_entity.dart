class ProductEntity {
  final String? id;
  final String url;
  final String type;
  final String title;
  final double price;
  final String imageUrl;
  final String description;

  ProductEntity({
    this.id,
    required this.url,
    required this.type,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}
