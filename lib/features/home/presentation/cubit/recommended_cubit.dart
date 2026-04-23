import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';
import 'package:grocery1/features/home/domain/usecase/recommended_meal_use_case.dart';
import 'package:meta/meta.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.recommendedMealUseCase) : super(RecommendedInitial());
  final RecommendedMealUseCase recommendedMealUseCase;

  Future<void> getRecommendedForYou() async {
    emit(RecommendedLoading());
    final request = await recommendedMealUseCase.call();
    request.fold(
          (failure) => emit(RecommendedError(failure.failuremessage)),
          (meals)   => emit(RecommendedSuccess(meals)),
    );
  }
}