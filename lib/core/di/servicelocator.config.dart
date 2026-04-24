// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/data_Source/login_remote_data_source.dart'
    as _i200;
import '../../features/login/data/data_Source/login_remote_data_source_impl.dart'
    as _i544;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo.dart' as _i0;
import '../../features/login/domain/useCase/login_use_case.dart' as _i630;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i147;
import '../../features/signup/data/repositories/datasoures/remoteDataSourses/firebase_auth_datasourceImpl.dart'
    as _i1020;
import '../../features/signup/data/repositories/datasoures/remoteDataSourses/register_remote_datasourceImpl.dart'
    as _i979;
import '../../features/signup/data/repositories/repositories/firebase_auth_repostiory_impl.dart'
    as _i867;
import '../../features/signup/data/repositories/repositories/register_repository_impl.dart'
    as _i34;
import '../../features/signup/domain/repositories/datasourses/remoteDataSourse/firebase_auth_datasource.dart'
    as _i836;
import '../../features/signup/domain/repositories/datasourses/remoteDataSourse/register_remote_datasource.dart'
    as _i318;
import '../../features/signup/domain/repositories/repositories/firebase_auth_repository.dart'
    as _i159;
import '../../features/signup/domain/repositories/repositories/register_repository.dart'
    as _i195;
import '../../features/signup/domain/usecases/firebase_auth_usecase.dart'
    as _i700;
import '../../features/signup/domain/usecases/register_usecase.dart' as _i600;
import '../../features/signup/presentation/ui/auth/cubit/firebase_auth_view_model.dart'
    as _i917;
import '../../features/signup/presentation/ui/auth/cubit/register_view_model.dart'
    as _i539;
import '../api/api_manager.dart' as _i1047;
import '../firebase/auth_service.dart' as _i35;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth());
    gh.factory<_i200.LoginRemoteDataSource>(
        () => _i544.LoginRemoteDataSourceImpl());
    gh.factory<_i318.Registerremotedatasource>(() =>
        _i979.Registerremotedatasourceimpl(apiManger: gh<_i1047.ApiManager>()));
    gh.factory<_i0.LoginRepo>(
        () => _i176.LoginRepoImpl(gh<_i200.LoginRemoteDataSource>()));
    gh.factory<_i836.Firebaseauthdatasource>(
        () => _i1020.Firebaseauthdatasourceimpl(auth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i195.RegisterRepository>(() => _i34.Registerrepositoryimpl(
        registerremotedatasource: gh<_i318.Registerremotedatasource>()));
    gh.factory<_i630.LoginUseCase>(
        () => _i630.LoginUseCase(loginRepo: gh<_i0.LoginRepo>()));
    gh.factory<_i147.LoginCubit>(
        () => _i147.LoginCubit(gh<_i630.LoginUseCase>()));
    gh.factory<_i159.Firebaseauthrepository>(() =>
        _i867.Firebaseauthrepostioryimpl(
            datasource: gh<_i836.Firebaseauthdatasource>()));
    gh.factory<_i600.RegisterUseCase>(() => _i600.RegisterUseCase(
        registerRepository: gh<_i195.RegisterRepository>()));
    gh.factory<_i539.RegisterViewModel>(() =>
        _i539.RegisterViewModel(registerUseCase: gh<_i600.RegisterUseCase>()));
    gh.factory<_i700.SignInWithGoogleUseCase>(() =>
        _i700.SignInWithGoogleUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithEmailUseCase>(
        () => _i700.SignInWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignUpWithEmailUseCase>(
        () => _i700.SignUpWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithFacebookUseCase>(() =>
        _i700.SignInWithFacebookUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.AuthUseCases>(() => _i700.AuthUseCases(
          google: gh<_i700.SignInWithGoogleUseCase>(),
          email: gh<_i700.SignInWithEmailUseCase>(),
          signUp: gh<_i700.SignUpWithEmailUseCase>(),
          facebook: gh<_i700.SignInWithFacebookUseCase>(),
        ));
    gh.factory<_i917.FirebaseauthViewModel>(() =>
        _i917.FirebaseauthViewModel(authUseCases: gh<_i700.AuthUseCases>()));
    return this;
  }
}

class _$FirebaseModule extends _i35.FirebaseModule {}
