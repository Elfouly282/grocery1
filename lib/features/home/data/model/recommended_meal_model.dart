import '../../domain/entity/recommended_meal_entity.dart';
import 'category_model.dart';

class RecommendedMealModel {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String imageUrl;
  final String? offerTitle;
  final double price;
  final double? discountPrice;
  final double finalPrice;
  final bool hasOffer;
  final bool isFeatured;
  final CategoryModel category;
  final String features;
  final String recommendationReason;

  const RecommendedMealModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imageUrl,
    this.offerTitle,
    required this.price,
    this.discountPrice,
    required this.finalPrice,
    required this.hasOffer,
    required this.isFeatured,
    required this.category,
    required this.features,
    required this.recommendationReason,
  });

  factory RecommendedMealModel.fromJson(Map<String, dynamic> json) {
    return RecommendedMealModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imageUrl: json['image_url'],
      offerTitle: json['offer_title'],
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discount_price'] != null
          ? (json['discount_price'] as num).toDouble()
          : null,
      finalPrice: (json['final_price'] as num).toDouble(),
      hasOffer: json['has_offer'],
      isFeatured: json['is_featured'],
      category: CategoryModel.fromJson(json['category']),
      features: json['features'],
      recommendationReason: json['recommendation_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'image_url': imageUrl,
      'offer_title': offerTitle,
      'price': price,
      'discount_price': discountPrice,
      'final_price': finalPrice,
      'has_offer': hasOffer,
      'is_featured': isFeatured,
      'category': category.toJson(),
      'features': features,
      'recommendation_reason': recommendationReason,
    };
  }

  RecommendedMealEntity toEntity() {
    return RecommendedMealEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imageUrl: imageUrl,
      offerTitle: offerTitle,
      price: price,
      discountPrice: discountPrice,
      finalPrice: finalPrice,
      hasOffer: hasOffer,
      isFeatured: isFeatured,
      category: category.toEntity(),
      features: features,
      recommendationReason: recommendationReason,
    );
  }
}