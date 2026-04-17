
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/presentation/ui/auth/cubit/register_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/register_useCase.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(RegisterInitState());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  void register()async{
    if(formKey.currentState?.validate()==true){
      emit(RegisterLoadingState());
      var either=await registerUseCase.invoke(fullNameController.text, mailController.text,
          passwordController.text,rePasswordController.text,phoneController.text);
      either.fold((error){
        emit(RegisterErrorState(errorMessage: error));
      }, (response){
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
    }

}