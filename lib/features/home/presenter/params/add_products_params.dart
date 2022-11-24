class AddProductsParams {
  final String? id;
  final String title;
  final String type;
  final String description;
  final String imageUrl;
  final double price;
  final int rating;

  AddProductsParams({
    this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}
