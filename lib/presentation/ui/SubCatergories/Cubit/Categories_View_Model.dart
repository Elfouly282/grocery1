import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/CategoriesUseCase.dart';
import 'categories_state.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoryState> {
  final CategoriesUseCase categoriesUseCase;

  CategoriesViewModel({required this.categoriesUseCase})
      : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await categoriesUseCase.invoke();
     print(result);
    result.fold(
          (failure) => emit(CategoryError(failure.failuremessage)),
          (response) => emit(CategorySuccess(response)),
    );
  }
}