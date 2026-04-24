import 'package:bloc/bloc.dart';
import 'package:grocery1/features/home/domain/entity/meal_entity.dart';
import 'package:grocery1/features/home/domain/usecase/get_all_deals_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getAllDealsUseCase) : super(HomeInitial());
  final GetAllDealsUseCase getAllDealsUseCase;

  Future<void>getTodayDeals()async{
    emit(HomeLoading());
    final request=await getAllDealsUseCase.call();
    request.fold(
          (failure) => emit(HomeError(failure.failuremessage)),
          (meals)   => emit(HomeSuccess(meals)),
    );

  }

}
