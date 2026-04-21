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
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/datasoures/remoteDataSourses/FirebaseAuthDatasourceImpl.dart'
    as _i1055;
import '../../data/repositories/datasoures/remoteDataSourses/RegisterRemoteDataSourceImpl.dart'
    as _i759;
import '../../data/repositories/repositories/FirebaseAuthRepostioryImpl.dart'
    as _i529;
import '../../data/repositories/repositories/RegisterRepositoryImpl.dart'
    as _i1022;
import '../../domain/repositories/datasourses/remoteDataSourse/FirebaseAuthDataSource.dart'
    as _i838;
import '../../domain/repositories/datasourses/remoteDataSourse/RegisterRemoteDataSource.dart'
    as _i597;
import '../../domain/repositories/repositories/CategoriesRepository.dart'
    as _i1012;
import '../../domain/repositories/repositories/CategoryDetailsRepository.dart'
    as _i222;
import '../../domain/repositories/repositories/FirebaseAuthRepository.dart'
    as _i312;
import '../../domain/repositories/repositories/RegisterRepository.dart'
    as _i220;
import '../../domain/usecases/CategoriesUseCase.dart' as _i294;
import '../../domain/usecases/firebaseAuthUsecase.dart' as _i462;
import '../../domain/usecases/register_useCase.dart' as _i216;
import '../../Features/domain/repositories/repositories/FirebaseAuthRepository.dart'
    as _i727;
import '../../Features/domain/repositories/repositories/RegisterRepository.dart'
    as _i321;
import '../../Features/domain/usecases/firebaseAuthUsecase.dart' as _i267;
import '../../Features/domain/usecases/register_useCase.dart' as _i429;
import '../../Features/presentation/ui/auth/cubit/firebaseAuth_view_model.dart'
    as _i236;
import '../../Features/presentation/ui/auth/cubit/register_view_model.dart'
    as _i401;
import '../../Features/SubCategories/data/repositories/datasoures/remoteDataSourses/Categories_Data_Source_Impl.dart'
    as _i50;
import '../../Features/SubCategories/data/repositories/datasoures/remoteDataSourses/CategoryDetailsDataSourceIpml.dart'
    as _i188;
import '../../Features/SubCategories/data/repositories/repositories/Categories_Repository_Impl.dart'
    as _i948;
import '../../Features/SubCategories/data/repositories/repositories/CategoryDetailsRepositoryImpl.dart'
    as _i500;
import '../../Features/SubCategories/domain/repositories/datasourses/remoteDataSourse/CategoriesDataSource.dart'
    as _i1000;
import '../../Features/SubCategories/domain/repositories/datasourses/remoteDataSourse/CategoryDetailsDataSource.dart'
    as _i24;
import '../../Features/SubCategories/domain/usecases/CategoriesUseCase.dart'
    as _i941;
import '../../Features/SubCategories/domain/usecases/CategoryDetailsUseCase.dart'
    as _i46;
import '../../Features/SubCategories/presentation/ui/SubCatergories/Cubit/Categories_View_Model.dart'
    as _i759;
import '../../Features/SubCategories/presentation/ui/SubCatergories/Cubit/CategoryDetails_View_Model.dart'
    as _i682;
import '../../presentation/ui/auth/cubit/firebaseAuth_view_model.dart' as _i929;
import '../../presentation/ui/auth/cubit/register_view_model.dart' as _i450;
import '../api/api_manager.dart' as _i1047;
import '../Firebase/auth_service.dart' as _i140;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i1047.ApiManger>(() => _i1047.ApiManger());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth());
    gh.factory<_i429.RegisterUseCase>(
      () => _i429.RegisterUseCase(
        registerRepository: gh<_i321.RegisterRepository>(),
      ),
    );
    gh.factory<_i1000.CategoriesDataSource>(
      () => _i50.CategoriesDataSourceImpl(apiManger: gh<_i1047.ApiManger>()),
    );
    gh.factory<_i1012.Categoriesrepository>(
      () => _i948.CategoriesRepositoryImpl(
        dataSource: gh<_i1000.CategoriesDataSource>(),
      ),
    );
    gh.factory<_i597.Registerremotedatasource>(
      () =>
          _i759.Registerremotedatasourceimpl(apiManger: gh<_i1047.ApiManger>()),
    );
    gh.factory<_i267.SignInWithGoogleUseCase>(
      () => _i267.SignInWithGoogleUseCase(gh<_i727.Firebaseauthrepository>()),
    );
    gh.factory<_i267.SignInWithEmailUseCase>(
      () => _i267.SignInWithEmailUseCase(gh<_i727.Firebaseauthrepository>()),
    );
    gh.factory<_i267.SignUpWithEmailUseCase>(
      () => _i267.SignUpWithEmailUseCase(gh<_i727.Firebaseauthrepository>()),
    );
    gh.factory<_i267.SignInWithFacebookUseCase>(
      () => _i267.SignInWithFacebookUseCase(gh<_i727.Firebaseauthrepository>()),
    );
    gh.factory<_i24.CategoryDetailsDatasource>(
      () => _i188.CategoryDetailsDataSourceImpl(
        apiManger: gh<_i1047.ApiManger>(),
      ),
    );
    gh.factory<_i267.AuthUseCases>(
      () => _i267.AuthUseCases(
        google: gh<_i267.SignInWithGoogleUseCase>(),
        email: gh<_i267.SignInWithEmailUseCase>(),
        signUp: gh<_i267.SignUpWithEmailUseCase>(),
        facebook: gh<_i267.SignInWithFacebookUseCase>(),
      ),
    );
    gh.factory<_i941.CategoriesUseCase>(
      () => _i941.CategoriesUseCase(
        categoriesrepository: gh<_i1012.Categoriesrepository>(),
      ),
    );
    gh.factory<_i294.CategoriesUseCase>(
      () => _i294.CategoriesUseCase(
        categoriesrepository: gh<_i1012.Categoriesrepository>(),
      ),
    );
    gh.factory<_i759.CategoriesViewModel>(
      () => _i759.CategoriesViewModel(
        categoriesUseCase: gh<_i941.CategoriesUseCase>(),
      ),
    );
    gh.factory<_i401.RegisterViewModel>(
      () =>
          _i401.RegisterViewModel(registerUseCase: gh<_i429.RegisterUseCase>()),
    );
    gh.factory<_i838.Firebaseauthdatasource>(
      () => _i1055.Firebaseauthdatasourceimpl(auth: gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i222.CategoryDetailsRepository>(
      () => _i500.Categorydetailsrepositoryimpl(
        datasource: gh<_i24.CategoryDetailsDatasource>(),
      ),
    );
    gh.factory<_i236.FirebaseauthViewModel>(
      () => _i236.FirebaseauthViewModel(
        googleUseCase: gh<_i267.SignInWithGoogleUseCase>(),
        emailUseCase: gh<_i267.SignInWithEmailUseCase>(),
        signUpUseCase: gh<_i267.SignUpWithEmailUseCase>(),
        facebookUseCase: gh<_i267.SignInWithFacebookUseCase>(),
      ),
    );
    gh.factory<_i220.RegisterRepository>(
      () => _i1022.Registerrepositoryimpl(
        registerremotedatasource: gh<_i597.Registerremotedatasource>(),
      ),
    );
    gh.factory<_i312.Firebaseauthrepository>(
      () => _i529.Firebaseauthrepostioryimpl(
        datasource: gh<_i838.Firebaseauthdatasource>(),
      ),
    );
    gh.factory<_i46.CategoryDetailsUseCase>(
      () => _i46.CategoryDetailsUseCase(
        categoryDetails: gh<_i222.CategoryDetailsRepository>(),
      ),
    );
    gh.factory<_i216.RegisterUseCase>(
      () => _i216.RegisterUseCase(
        registerRepository: gh<_i220.RegisterRepository>(),
      ),
    );
    gh.factory<_i462.SignInWithGoogleUseCase>(
      () => _i462.SignInWithGoogleUseCase(gh<_i312.Firebaseauthrepository>()),
    );
    gh.factory<_i462.SignInWithEmailUseCase>(
      () => _i462.SignInWithEmailUseCase(gh<_i312.Firebaseauthrepository>()),
    );
    gh.factory<_i462.SignUpWithEmailUseCase>(
      () => _i462.SignUpWithEmailUseCase(gh<_i312.Firebaseauthrepository>()),
    );
    gh.factory<_i462.SignInWithFacebookUseCase>(
      () => _i462.SignInWithFacebookUseCase(gh<_i312.Firebaseauthrepository>()),
    );
    gh.factory<_i682.CategoryDetailsViewModel>(
      () => _i682.CategoryDetailsViewModel(
        categoryDetailsUseCase: gh<_i46.CategoryDetailsUseCase>(),
      ),
    );
    gh.factory<_i450.RegisterViewModel>(
      () =>
          _i450.RegisterViewModel(registerUseCase: gh<_i216.RegisterUseCase>()),
    );
    gh.factory<_i462.AuthUseCases>(
      () => _i462.AuthUseCases(
        google: gh<_i462.SignInWithGoogleUseCase>(),
        email: gh<_i462.SignInWithEmailUseCase>(),
        signUp: gh<_i462.SignUpWithEmailUseCase>(),
        facebook: gh<_i462.SignInWithFacebookUseCase>(),
      ),
    );
    gh.factory<_i929.FirebaseauthViewModel>(
      () => _i929.FirebaseauthViewModel(
        googleUseCase: gh<_i462.SignInWithGoogleUseCase>(),
        emailUseCase: gh<_i462.SignInWithEmailUseCase>(),
        signUpUseCase: gh<_i462.SignUpWithEmailUseCase>(),
        facebookUseCase: gh<_i462.SignInWithFacebookUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i140.FirebaseModule {}
