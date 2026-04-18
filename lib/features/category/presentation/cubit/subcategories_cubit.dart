import 'package:bloc/bloc.dart';
import 'package:grocery1/features/category/domain/entities/meal_entity.dart';
import 'package:grocery1/features/category/domain/entities/subcategories_entity.dart';
import 'package:grocery1/features/category/domain/usecase/getsubcate_usecase.dart';
import 'package:grocery1/features/category/domain/usecase/getsubcategorydetails_usecase.dart';
import 'package:injectable/injectable.dart';

part 'subcategories_state.dart';

@singleton
class SubcategoriesCubit extends Cubit<SubcategoriesState> {
  final GetSubcategoriesUseCase getsubcategory;
  final GetsubcategorydetailsUsecase getsubcategorydetails;

  SubcategoriesCubit(this.getsubcategory, this.getsubcategorydetails)
    : super(SubcategoriesInitial());

  Future<void> fetchSubCategory() async {
    emit(SubcategoriesLoading());

    final result = await getsubcategory();
    result.fold((e) {
      emit(SubcategoriesError(e.failuremessage));
    }
    , (subcategories) => emit(SubcategoriesLoaded(subcategories)));
  }

  Future<void> fetchSubCategoryDetails(int id) async {
    emit(SubcategoriesDetailsLoading());
    final result = await getsubcategorydetails(id);
    result.fold(
      (e) => emit(SubcategoriesDetailsError(e.failuremessage)),
      (subdetaillist) => emit(SubcategoriesDetailsLoaded(subdetaillist)),
    );
  }
}
