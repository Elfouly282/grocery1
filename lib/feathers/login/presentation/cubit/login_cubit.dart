import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery1/feathers/login/domain/useCase/login_use_case.dart';

import '../../../home/presentation/screens/home_screen.dart';
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
        print(failure.failuremessage);
      },
      (loginEntity) {
        emit(LoginSuccess(loginEntity));
      },
    );
  }
}
