import 'package:grocery1/features/list/domain/repositories/add_new_list_repository.dart';

import '../entities/add_new_list_entity.dart';

class GetAllListsUseCase {
  final AddNewListRepository repository;

  GetAllListsUseCase(this.repository);

  Future<List<AddNewListEntity>> call() {
    return repository.getSmartLists();
  }
}

// class GetOneOfListUseCase {
//   final AddNewListRepository repository;

//   GetOneOfListUseCase(this.repository);

//   Future<AddNewListEntity> call(int id) {
//     return repository.getSmartList(id);
//   }
// }

class CreateNewListUseCase {
  final AddNewListRepository repository;

  CreateNewListUseCase(this.repository);

  Future<void> call({
    required String name,
    String? description,
    String? imagePath,
    required List<int> mealIds,
  }) {
    return repository.createSmartList(
      name: name,
      description: description,
      imagePath: imagePath,
      mealIds: mealIds,
    );
  }
}
