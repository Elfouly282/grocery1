import 'package:grocery1/features/list/data/data_sources/add_new_list_remote_data.dart';
import 'package:grocery1/features/list/domain/entities/add_new_list_entity.dart';
import 'package:grocery1/features/list/domain/repositories/add_new_list_repository.dart';

class AddNewListRepositoryimpl implements AddNewListRepository {
  final AddNewListRemoteData remote;

  AddNewListRepositoryimpl(this.remote);

  @override
  Future<List<AddNewListEntity>> getSmartLists() {
    return remote.getSmartLists();
  }

  @override
  Future<AddNewListEntity> getSmartList(int id) {
    return remote.getSmartList(id);
  }

  @override
  Future<void> createSmartList({
    required String name,
    String? description,
    String? imagePath,
    required List<int> mealIds,
  }) {
    return remote.createSmartList(
      name: name,
      description: description,
      imagePath: imagePath,
      mealIds: mealIds,
    );
  }

  @override
  Future<void> updateSmartList({
    required int id,
    required String name,
    String? description,
    required List<int> mealIds,
  }) {
    return remote.updateSmartList(
      id: id,
      name: name,
      description: description,
      mealIds: mealIds,
    );
  }

  @override
  Future<void> deleteSmartList(int id) {
    return remote.deleteSmartList(id);
  }
}
