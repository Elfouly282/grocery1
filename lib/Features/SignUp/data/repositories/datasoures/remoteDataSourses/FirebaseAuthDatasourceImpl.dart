import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/entities/RegisterResponseEntity.dart';
import '../../../../domain/repositories/datasourses/remoteDataSourse/FirebaseAuthDataSource.dart';
@Injectable(as:Firebaseauthdatasource)
class Firebaseauthdatasourceimpl implements Firebaseauthdatasource{
  final FirebaseAuth auth;
  // final GoogleSignIn googleSignIn;
  Firebaseauthdatasourceimpl({required this.auth});
  @override
  Future<UserEntity> signUpWithEmail(String email, String password) async {
    try {
      final res = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = res.user!;
      return UserEntity(id:int.parse(user.uid), email: user.email);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseError(e));
    }
  }

// ================= EMAIL SIGN IN =================
  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = res.user!;
      return UserEntity(id: int.parse(user.uid), email: user.email);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseError(e));
    }
  }

// ================= GOOGLE =================
  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('email');
      googleProvider.addScope('profile');

      final res = await auth.signInWithProvider(googleProvider);

      return res;
    } catch (e) {
      throw Exception("Google Error: $e");
    }
  }

// ================= FACEBOOK =================
  Future<UserCredential> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!;

        final credential = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );

        final res = await auth.signInWithCredential(credential);

        final user = res.user!;
        return res;
      } else {
        throw Exception(result.message ?? "Facebook login failed");
      }
    } catch (e) {
      throw Exception("Facebook Error: $e");
    }
  }

// ================= LOGOUT =================

// ================= ERROR HANDLER =================
  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email already exists';
      case 'weak-password':
        return 'Weak password';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Wrong password';
      case 'invalid-email':
        return 'Invalid email';
      default:
        return e.message ?? 'Authentication error';
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }



}