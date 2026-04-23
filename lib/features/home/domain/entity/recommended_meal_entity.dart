import 'category_entity.dart';

class RecommendedMealEntity {
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
  final CategoryEntity category;
  final String features;
  final String recommendationReason;

  const RecommendedMealEntity({
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

  bool get hasDiscount =>
      discountPrice != null && discountPrice! > 0 && discountPrice! < price;

  double get discountPercentage {
    if (!hasDiscount) return 0;
    return ((price - discountPrice!) / price) * 100;
  }

  List<String> get featureList =>
      features.split(',').map((f) => f.trim()).where((f) => f.isNotEmpty).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is RecommendedMealEntity && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'RecommendedMealEntity(id: $id, title: $title)';
}