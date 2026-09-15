class FoodModel {
  final String id;
  final String name;
  final String image;
  final double rating;
  final bool isFavorite;
  final double price;

  FoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.isFavorite,
    required this.price,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      isFavorite: json['isFavorite'] ?? false,
      price: (json['price'] as num).toDouble(),
    );
  }
}