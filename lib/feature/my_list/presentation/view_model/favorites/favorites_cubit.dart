import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/feature/my_list/domain/entity/favorite_entity.dart';
import 'package:grocery1/feature/my_list/domain/use_case/favoriets/add_to_cart_use_case.dart';
import 'package:grocery1/feature/my_list/domain/use_case/favoriets/remove_favorites_use_case.dart';
import 'package:grocery1/feature/my_list/domain/use_case/favoriets/get_favorites_use_case.dart';
import 'package:grocery1/feature/my_list/presentation/view_model/favorites/favorites_state.dart';

import 'package:injectable/injectable.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddAndRemoveFavoriteUseCase _addAndRemoveFavoriteUseCase;
  final AddToCartFavoritesUseCase _addToCartUseCase;
  List<FavoriteEntity> favoriteEntity = [];

  FavoritesCubit(
    this._getFavoritesUseCase,
    this._addAndRemoveFavoriteUseCase,
    this._addToCartUseCase,
  ) : super(FavoritesInitial());

  Future<void> fetchFavorites() async {
    emit(FavoritesLoading());
    final result = await _getFavoritesUseCase.invoke();
    result.fold(
      (failure) => emit(FavoritesError(failure.failuremessage)),
      (favorites) => emit(FavoritesLoaded(favorites)),
    );
  }

  Future<void> removeFavorite(int mealId) async {
    final result = await _addAndRemoveFavoriteUseCase.invoke(mealId);
    result.fold(
      (failure) => emit(RemoveFavoriteError(failure.failuremessage)),
      (success) {
        if (state is FavoritesLoaded) {
          final currentFavorites = (state as FavoritesLoaded).favorites;
          final updatedFavorites = currentFavorites
              .where((item) => item.id != mealId)
              .toList();
          emit(RemoveFavoriteSuccess(success));
          emit(FavoritesLoaded(updatedFavorites));
        }
      },
    );
  }

  Future<void> addToCart(int mealId) async {
  // 1. شيلنا الـ favoriteEntity من بره وجبناها من الـ State الحالية
  List<FavoriteEntity> currentList = [];
  if (state is FavoritesLoaded) {
    currentList = (state as FavoritesLoaded).favorites;
  }

  final result = await _addToCartUseCase.invoke(mealId);

  result.fold(
    (failure) {
      emit(AddToCartFavoriteError(failure.failuremessage));
      // رجع الحالة القديمة عشان الـ UI ميفضلش واقف
      if (currentList.isNotEmpty) {
        emit(FavoritesLoaded(currentList));
      }
    },
    (success) {
      // 2. ابعت حالة النجاح (عشان الـ Toast)
      emit(AddToCartDone(success));
      
      // 3. رجع لستة الـ Favorites زي ما هي 
      // (إلا لو الـ API بتاع الكارت بيأثر على لستة الفيفورت، وقتها ممكن تعمل fetch من جديد)
      emit(FavoritesLoaded(currentList));
    },
  );
}
}
