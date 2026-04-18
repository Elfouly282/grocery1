class CategoryModel {
  final int id;
  final String name;
  final String? slug;

  CategoryModel({required this.id, required this.name, this.slug});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String?,
  );
  //  factory CategoryModel.empty() {
  //     return CategoryModel(
  //       id: 0,
  //       name: '',
  //       slug: '',
  //     );
  //   }
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'slug': slug};
}
