import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/list/domain/entities/add_new_list_entity.dart';
import 'package:grocery1/features/list/domain/usecases/add_new_list_usecase.dart';
import 'package:grocery1/features/list/presentation/cubit/list_state.dart';
import 'package:image_picker/image_picker.dart';

class SmartListCubit extends Cubit<SmartListState> {
  final CreateNewListUseCase createSmartList;
  final GetAllListsUseCase getAllLists;

  SmartListCubit(this.createSmartList, this.getAllLists)
    : super(SmartListInitial());

  String? imagePath;
  List<int> selectedMeals = [];
  List<AddNewListEntity> products = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imagePath = picked.path;
      emit(FormChanged()); // بدل Initial
    }
  }

  Future<void> init() async {
    products = await getAllLists.call();
    emit(GetAllProducts());
  }

  /// 🔹 اختيار / إلغاء منتج
  void toggleMeal(int id) {
    if (selectedMeals.contains(id)) {
      selectedMeals.remove(id);
    } else {
      selectedMeals.add(id);
    }
    emit(SmartListInitial());
  }

  /// 🔹 submit
  Future<void> submit({required String name, String? description}) async {
    emit(SmartListLoading());

    try {
      await createSmartList(
        name: name,
        description: description,
        imagePath: imagePath,
        mealIds: selectedMeals,
      );

      emit(SmartListSuccess());
    } catch (e) {
      emit(SmartListError(e.toString()));
    }
  }
}
