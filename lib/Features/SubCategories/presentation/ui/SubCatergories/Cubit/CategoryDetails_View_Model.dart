import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/CategoryDetailsUseCase.dart';
import 'CategoryDetails_state.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  final CategoryDetailsUseCase categoryDetailsUseCase;

  CategoryDetailsViewModel({required this.categoryDetailsUseCase})
      : super(CategoryDetailsInitial());

  Future<void> getCategoryDetails(int id) async {
    emit(CategoryDetailsLoading());

    final result = await categoryDetailsUseCase.invoke(id);
    result.fold(
          (failure) => emit(CategoryDetailsError(failure.failuremessage)),
          (response) => emit(CategoryDetailsSuccess(response)),
    );
  }
}