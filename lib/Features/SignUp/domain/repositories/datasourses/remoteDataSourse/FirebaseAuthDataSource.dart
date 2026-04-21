import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery1/Features/SignUp/domain/entities/RegisterResponseEntity.dart';


abstract class Firebaseauthdatasource {
  Future<UserEntity> signUpWithEmail(String email, String password);
  Future<UserEntity> signInWithEmail(String email, String password);
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
  Future<void> signOut();
}