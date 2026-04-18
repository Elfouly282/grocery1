import '../../../../domain/entities/RegisterResponseEntity.dart';

abstract class Firebaseauthstate {}

class AuthInitial extends Firebaseauthstate {}

class AuthLoading extends Firebaseauthstate {}

class AuthSuccess extends Firebaseauthstate {
  final UserEntity user;
  AuthSuccess(this.user);
}

class AuthError extends Firebaseauthstate {
  final String message;
  AuthError(this.message);
}