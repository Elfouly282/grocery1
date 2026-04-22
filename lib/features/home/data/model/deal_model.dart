
import 'category_model.dart';

class DealModel {
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
  final CategoryModel category;
  final String features;
  final DateTime? availableDate;
  final DateTime createdAt;

  DealModel({
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
    required this.category,
    required this.features,
    this.availableDate,
    required this.createdAt,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
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
      category: CategoryModel.fromJson(json['category']),
      features: json['features'],
      availableDate: json['available_date'] != null
          ? DateTime.parse(json['available_date'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}