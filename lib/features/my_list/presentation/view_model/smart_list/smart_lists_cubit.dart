import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/my_list/domain/entity/smart_list_entity.dart';
import 'package:grocery1/features/my_list/domain/use_case/smart_list/add_all_to_cart_use_case.dart';
import 'package:grocery1/features/my_list/domain/use_case/smart_list/delete_smart_list_use_case.dart';
import 'package:grocery1/features/my_list/domain/use_case/smart_list/get_smart_lists_use_case.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SmartListsCubit extends Cubit<SmartListsState> {
  final GetSmartListsUseCase _getSmartListsUseCase;
  final DeleteSmartListUseCase _deleteSmartListUseCase;
  AddToCartSmartListUseCase _addAllToCartUseCase;

  SmartListsCubit(
    this._getSmartListsUseCase,
    this._deleteSmartListUseCase,
    this._addAllToCartUseCase,
  ) : super(SmartListsInitial());

  Future<void> fetchSmartLists() async {
    emit(SmartListsLoading());
    final result = await _getSmartListsUseCase.invoke();
    result.fold(
      (failure) => emit(SmartListsError(failure.failuremessage)),
      (smartLists) => emit(SmartListsLoaded(smartLists)),
    );
  }

  Future<void> deleteSmartList(int id) async {
    final result = await _deleteSmartListUseCase.invoke(id);
    result.fold(
      (failure) => emit(DeleteSmartListError(failure.failuremessage)),
      (deleteMessage) {
        if (state is SmartListsLoaded) {
          final currentList = (state as SmartListsLoaded).smartLists;
          final updatedList = currentList
              .where((item) => item.id != id)
              .toList();
          emit(DeleteSmartListSuccess(deleteMessage));
          emit(SmartListsLoaded(updatedList));
        }
      },
    );
  }

  Future<void> addAllToCart(SmartListEntity entity) async {
    List<SmartListEntity> currentLists = [];
    if (state is SmartListsLoaded) {
      currentLists = (state as SmartListsLoaded).smartLists;
    }
    final mealIds = entity.meals.map((meal) => meal.id).toList();

    for (var mealId in mealIds) {
      await _addAllToCartUseCase.invoke(mealId);
    }
    emit(AddAllToCartSuccess("All items added to cart successfully!"));
    emit(SmartListsLoaded(currentLists));
  }
}
