import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class Firebaseauthdatasource {
  Future<UserEntity> signUpWithEmail(String email, String password);
  Future<UserEntity> signInWithEmail(String email, String password);
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInWithFacebook();
  Future<void> signOut();
}