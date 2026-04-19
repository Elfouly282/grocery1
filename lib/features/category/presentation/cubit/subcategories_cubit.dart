import 'package:bloc/bloc.dart';
import 'package:grocery1/features/category/domain/entities/meal_entity.dart';
import 'package:grocery1/features/category/domain/entities/subcategories_entity.dart';
import 'package:grocery1/features/category/domain/usecase/getsubcate_usecase.dart';
import 'package:grocery1/features/category/domain/usecase/getsubcategorydetails_usecase.dart';
import 'package:injectable/injectable.dart';

part 'subcategories_state.dart';

@singleton
class SubcategoriesCubit extends Cubit<Subcategories> {
  final GetSubcategoriesUseCase getsubcategory;
  final GetsubcategorydetailsUsecase getsubcategorydetails;

  SubcategoriesCubit(this.getsubcategory, this.getsubcategorydetails)
    : super(Subcategories());

  Future<void> fetchSubCategory() async {
    emit(state.copyWith(categoriesLoading: true));

    final result = await getsubcategory();

    result.fold(
      (e) {
        emit(state.copyWith(error: e.failuremessage, categoriesLoading: false));
      },
      (list) {
        final firstId = list.isNotEmpty ? list.first.id : null;

        emit(
          state.copyWith(
            subcategories: list,
            categoriesLoading: false,
            selectedCategoryId: firstId,
          ),
        );

        if (firstId != null) {
          fetchSubCategoryDetails(firstId);
        }
      },
    );
  }

  Future<void> fetchSubCategoryDetails(int id) async {
    emit(
      state.copyWith(
        selectedCategoryId: id,
        productsLoading: true,
        error: null,
      ),
    );

    final result = await getsubcategorydetails(id);

    result.fold(
      (e) =>
          emit(state.copyWith(error: e.failuremessage, productsLoading: false)),
      (mealslist) => emit(
        state.copyWith(
          error: null,
          products: mealslist,
          productsLoading: false,
        ),
      ),
    );
  }

  void selectCategory(int id) {
    //  ------------------   if select same index not send request
    if (state.selectedCategoryId == id) return;
    fetchSubCategoryDetails(id);
  }
}
