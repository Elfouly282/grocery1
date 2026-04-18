class MealModel {
  int id;
  String title;
  String? slug;
  String? imageUrl;
  double? price;
  double? discountPrice;
  double? finalPrice;
  double? rating;
  bool? isFeatured;
  String? features;

  MealModel({
   required this.id,
  required  this.title,
    this.slug,
    this.imageUrl,
    this.price,
    this.discountPrice,
    this.finalPrice,
    this.rating,
    this.isFeatured,
    this.features,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
    id: json['id'] as int,
    title: json['title'] as String,
    slug: json['slug'] as String?,
    imageUrl: json['image_url'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    discountPrice: (json['discount_price'] as num?)?.toDouble(),
    finalPrice: (json['final_price'] as num?)?.toDouble(),
    rating: (json['rating'] as num?)?.toDouble() ,
    isFeatured: json['is_featured'] as bool?,
    features: json['features'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'slug': slug,
    'image_url': imageUrl,
    'price': price,
    'discount_price': discountPrice,
    'final_price': finalPrice,
    'rating': rating,
    'is_featured': isFeatured,
    'features': features,
  };
}
