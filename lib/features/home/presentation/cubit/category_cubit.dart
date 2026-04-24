import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/entity/category_section_entity.dart';
import 'package:grocery1/features/home/domain/usecase/category_section_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';
@injectable
class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categorySectionUseCase) : super(CategoryInitial());
  final CategorySectionUseCase categorySectionUseCase;

  Future<void> getAllCategory() async {
    emit(CategoryLoading());
    final request = await categorySectionUseCase.call();
    request.fold(
          (failure) => emit(CategoryError(failure.failuremessage)),
          (meals)   => emit(CategorySuccess(meals)),
    );
  }

}
