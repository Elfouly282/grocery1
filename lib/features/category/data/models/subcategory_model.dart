import 'package:grocery1/features/category/data/models/category_model.dart';

class SubcategoryModel {
  int id;
  String? name;
  String? slug;
  String? description;
  String? imageUrl;
  int order;
  CategoryModel? category;
  int? mealsCount;
  DateTime? createdAt;

  SubcategoryModel({
    required this.id,
    this.name,
    this.slug,
    this.description,
    this.imageUrl,
    required this.order,
    this.category,
    this.mealsCount,
    this.createdAt,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      SubcategoryModel(
        id: json['id'] as int,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        order: json['order'] as int,
        category: CategoryModel.fromJson(json['category']),
        mealsCount: json['meals_count'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );
}
