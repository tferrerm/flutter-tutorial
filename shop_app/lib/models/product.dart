class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String? imageURL;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageURL,
    this.isFavorite = false,
  });
}
