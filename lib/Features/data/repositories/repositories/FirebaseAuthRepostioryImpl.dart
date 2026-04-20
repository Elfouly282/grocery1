import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/domain/repositories/repositories/FirebaseAuthRepository.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/repositories/datasourses/remoteDataSourse/FirebaseAuthDataSource.dart';
@Injectable(as:Firebaseauthrepository )
class Firebaseauthrepostioryimpl implements Firebaseauthrepository {
  final Firebaseauthdatasource datasource;

  Firebaseauthrepostioryimpl({required this.datasource});

  // ================= EMAIL SIGN UP =================
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail(
      String email, String password) async {
    try {
      final user = await datasource.signUpWithEmail(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ================= EMAIL SIGN IN =================
  @override
  Future<Either<Failure, UserEntity>> signInWithEmail(
      String email, String password) async {
    try {
      final user = await datasource.signInWithEmail(email, password);
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ================= GOOGLE =================
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await datasource.signInWithGoogle();
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ================= FACEBOOK =================
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await datasource.signInWithFacebook();
      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ================= SIGN OUT =================
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}