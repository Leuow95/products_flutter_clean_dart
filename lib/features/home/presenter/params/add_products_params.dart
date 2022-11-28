class AddProductsParams {
  final int? id;
  final String title;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String description;

  AddProductsParams({
    this.id,
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.categoryId,
    required this.description,
  });
}
