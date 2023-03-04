class ModelProduct {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final ModelProductRating rating;

  ModelProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ModelProduct.fromJson(jsonData) {
    return ModelProduct(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: ModelProductRating.fromJson(jsonData),
    );
  }
}

class ModelProductRating {
  final double? rate;
  final int? count;

  ModelProductRating({required this.rate, required this.count});

  factory ModelProductRating.fromJson(jsonData) {
    
    return ModelProductRating(
      rate: jsonData['rating']['rate'],
      count: jsonData['rating']['count'],
    );
  }
}
