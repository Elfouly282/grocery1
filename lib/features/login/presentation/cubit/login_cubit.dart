import 'package:bloc/bloc.dart';


import '../../domain/useCase/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase.call(email: email, password: password);
    result.fold(
      (failure) {
        emit(LoginError(failure.failuremessage));

      },
      (loginEntity) {
        emit(LoginSuccess(loginEntity));
      },
    );
  }
}
