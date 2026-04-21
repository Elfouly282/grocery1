class SubcategoriesEntity {
  final int id;
  final String name;
  final String? imageUrl;
  final int mealsCount;
  final String categoryName;

  const SubcategoriesEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.mealsCount,
    required this.categoryName,
  });
}
