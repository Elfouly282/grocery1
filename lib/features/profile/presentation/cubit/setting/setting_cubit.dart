import 'package:bloc/bloc.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/profile/presentation/cubit/setting/setting_state.dart';



class SettingCubit extends Cubit<SettingsState> {

  final ApiManger apiManger;
  SettingCubit({required this.apiManger}) : super(SettingsInitial());

  Future<void> deleteAccount()async{
    emit(SettingsDeleteLoading());

    try{
      await  apiManger.deleteData(
           endPoint: ApiEndpoints.deleteAccount,
         headers: {
         //  'Authorization': 'Bearer $token',
         }
       );

      //delete token
    //  await UserPreferences.clearToken();

    emit(SettingsDeleteSuccess());
    }catch(e){
      print('delete account error : $e');
      emit(SettingsError(message: e.toString()));
    }

  }
}
