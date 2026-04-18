import 'package:grocery1/features/category/data/models/category_model.dart';

import 'meal_model.dart';

class SubcategoryDetailsModel {
  int id;
  String name;
  String? slug;
  String? description;
  String? imageUrl;
  int order;
  bool? isActive;
  CategoryModel? category;
  List<MealModel>? meals;
  int? mealsCount;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubcategoryDetailsModel({
   required this.id,
  required  this.name,
    this.slug,
    this.description,
    this.imageUrl,
   required this.order,
    this.isActive,
   required this.category,
    this.meals,
    this.mealsCount,
    this.createdAt,
    this.updatedAt,
  });

  factory SubcategoryDetailsModel.fromJson(Map<String, dynamic> json) => SubcategoryDetailsModel(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    imageUrl: json['image_url'] as String?,
    order: json['order'] as int,
    isActive: json['is_active'] as bool?,
    category:  CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => MealModel.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
    mealsCount: json['meals_count'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'description': description,
    'image_url': imageUrl,
    'order': order,
    'is_active': isActive,
    'category': category?.toJson(),
    'meals': meals?.map((e) => e.toJson()).toList(),
    'meals_count': mealsCount,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
