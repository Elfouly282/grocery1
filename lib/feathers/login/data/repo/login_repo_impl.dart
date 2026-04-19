import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/feathers/login/data/data_Source/login_remote_data_source.dart';
import 'package:grocery1/feathers/login/domain/repo/login_repo.dart';
import '../../domain/entity/login_entity.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await loginRemoteDataSource.login(
        email: email,
        password: password,
      );
      return result.map((model) => model.toEntity());
    } catch (e) {
      return Left(Failure(failuremessage: e.toString()));
    }
  }
}
