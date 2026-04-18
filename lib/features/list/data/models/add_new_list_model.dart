import 'package:grocery1/features/list/domain/entities/add_new_list_entity.dart';

class AddNewListModel extends AddNewListEntity {
  AddNewListModel({
    required super.id,
    required super.name,
    super.description,
    super.image,
    required super.mealIds,
  });

  factory AddNewListModel.fromJson(Map<String, dynamic> json) {
    return AddNewListModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      mealIds: List<int>.from(json['meal_ids'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "description": description, "meal_ids": mealIds};
  }
}
