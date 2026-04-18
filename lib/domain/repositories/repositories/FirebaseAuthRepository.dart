import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../entities/RegisterResponseEntity.dart';

abstract class Firebaseauthrepository {
  Future<Either<Failure, UserEntity>>signUpWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>> signInWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>>signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, void>>  signOut();
}