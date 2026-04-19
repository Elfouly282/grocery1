// run    => flutter pub run build_runner build
import 'package:get_it/get_it.dart';
import 'package:grocery1/feathers/login/domain/useCase/login_use_case.dart';

import '../../feathers/login/data/data_Source/login_remote_data_source.dart';
import '../../feathers/login/data/data_Source/login_remote_data_source_impl.dart';
import '../../feathers/login/data/repo/login_repo_impl.dart';
import '../../feathers/login/domain/repo/login_repo.dart';
import '../../feathers/login/presentation/cubit/login_cubit.dart';

final getit = GetIt.instance;

Future<void> configureDependencies() async {
  getit.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(),
  );
  getit.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getit<LoginRemoteDataSource>()),
  );
  getit.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepo: getit<LoginRepo>()),
  );

  getit.registerFactory<LoginCubit>(() => LoginCubit(getit<LoginUseCase>()));
}
