import 'package:grocery1/features/list/domain/entities/add_new_list_entity.dart';

abstract class AddNewListRepository {
  Future<List<AddNewListEntity>> getSmartLists();

  Future<AddNewListEntity> getSmartList(int id);

  Future<void> createSmartList({
    required String name,
    String? description,
    String? imagePath,
    required List<int> mealIds,
  });

  Future<void> updateSmartList({
    required int id,
    required String name,
    String? description,
    required List<int> mealIds,
  });

  Future<void> deleteSmartList(int id);
}
