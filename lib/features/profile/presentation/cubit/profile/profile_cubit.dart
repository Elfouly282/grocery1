import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api_endpoints.dart';
import '../../../../../core/api/api_manager.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiManger apiManger;

  ProfileCubit({required this.apiManger}) : super(ProfileInitial());

  Future<void> logout() async {
    emit(ProfileLoading());
    try {
      await apiManger.postData(
        endPoint: ApiEndpoints.logout,
        headers: {

         // 'Authorization': 'Bearer $token',
        },
      );
      emit(ProfileSuccess());
    } catch (e) {
      print('logout error: $e');
      emit(ProfileError(message: e.toString()));
    }
  }
}