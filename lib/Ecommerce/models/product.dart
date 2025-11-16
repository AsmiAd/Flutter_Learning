class Product {
  final int id;
  final String productName;
  final double price;
  final double previousPrice;
  bool isFavorite;
  final double rating;
  final int totalLikes;
  final String productImage;
  final String productCreatedAt;
  final List<String> displayImages;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.previousPrice,
    required this.isFavorite,
    required this.rating,
    required this.totalLikes,
    required this.productImage,
    required this.productCreatedAt,
    required this.displayImages,
  });
}