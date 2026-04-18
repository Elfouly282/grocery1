class AddNewListEntity {
  final int id;
  final String name;
  final String? description;
  final String? image;
  final List<int> mealIds;

  AddNewListEntity({
    required this.id,
    required this.name,
    this.description,
    this.image,
    required this.mealIds,
  });
}
