import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:grocery1/core/failure/failure.dart';

import '../../domain/forgot_password_repo.dart';
import 'forgot_password_state.dart';
import 'package:grocery1/core/failure/failure.dart';



class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo repo;
  ForgotPasswordCubit(this.repo) : super(ForgotPasswordInitial());

  bool isEmail=true;

  void toggleMethod(bool email){
    isEmail =email;
    emit(ForgotPasswordInitial());
  }


  Future<void>sendCode({String? email,String? phone})async{
    emit(ForgotPasswordLoading());
    final result= await repo.sendCode(email: email,phone: phone);
    result.fold(
        (failure)=>emit(ForgotPasswordError(failure.failuremessage)),
        (_)=>emit(ForgotPasswordSuccess()));
  }

  Future<void>verifyOtp(String otp)async{
    emit(ForgotPasswordLoading());
    final result= await repo.verifyOtp(otp);
    result.fold(
            (failure)=>emit(ForgotPasswordError(failure.failuremessage)),
            (_)=>emit(ForgotPasswordSuccess()));
  }


  Future<void>resetPassword(String newPassword)async{
    emit(ForgotPasswordLoading());
    final result= await repo.resetPassword( newPassword);
    result.fold(
            (failure)=>emit(ForgotPasswordError(failure.failuremessage)),
            (_)=>emit(ForgotPasswordSuccess()));
  }


}
