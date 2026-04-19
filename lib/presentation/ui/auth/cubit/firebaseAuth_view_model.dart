import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/firebaseAuthUsecase.dart';
import 'FirebaseAuthState.dart';
@injectable
class FirebaseauthViewModel extends Cubit<Firebaseauthstate>{
  final SignInWithGoogleUseCase googleUseCase;
  final SignInWithEmailUseCase emailUseCase;
  final SignUpWithEmailUseCase signUpUseCase;
  final SignInWithFacebookUseCase facebookUseCase;

  FirebaseauthViewModel({
    required this.googleUseCase,
    required this.emailUseCase,
    required this.signUpUseCase,
    required this.facebookUseCase,
  }) : super(AuthInitial());

  // ================= GOOGLE =================
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    final result = await googleUseCase();
    print("{result>>>>>$result}");
    result.fold(

          (failure) => emit(AuthError(failure.failuremessage)),
          (user) => emit(AuthSuccess(user)),

    );
  }

  // ================= EMAIL LOGIN =================
  Future<void> signInWithEmail(String email, String password) async {
    emit(AuthLoading());

    final result = await emailUseCase(email, password);

    result.fold(
          (failure) => emit(AuthError(failure.failuremessage)),
          (user) => emit(AuthSuccess(user)),
    );
  }

  // ================= SIGN UP =================
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());

    final result = await signUpUseCase(email, password);

    result.fold(
          (failure) => emit(AuthError(failure.failuremessage)),
          (user) => emit(AuthSuccess(user)),
    );
  }

  // ================= FACEBOOK =================
  Future<void> signInWithFacebook() async {
    emit(AuthLoading());

    final result = await facebookUseCase();

    result.fold(
          (failure) => emit(AuthError(failure.failuremessage)),
          (user) => emit(AuthSuccess(user)),
    );
  }
}