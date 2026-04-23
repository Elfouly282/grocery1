import '../../domain/entity/category_entity.dart';


class CategoryModel {
  final int id;
  final String name;
  final String? slug;

  const CategoryModel({
    required this.id,
    required this.name,
    this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      slug: slug,
    );
  }
}