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

import '../../features/home/data/data_source/category_section_remote_data_source.dart'
    as _i83;
import '../../features/home/data/data_source/category_section_remote_data_source_impl.dart'
    as _i1008;
import '../../features/home/data/data_source/meals_remote_data_source.dart'
    as _i864;
import '../../features/home/data/data_source/meals_remote_data_source_impl.dart'
    as _i227;
import '../../features/home/data/data_source/product_search_remote_data_source.dart'
    as _i823;
import '../../features/home/data/data_source/product_search_remote_data_source_impl.dart'
    as _i704;
import '../../features/home/data/data_source/recommended_meal_remote_data_source.dart'
    as _i494;
import '../../features/home/data/data_source/recommended_meal_remote_data_source_impl.dart'
    as _i71;
import '../../features/home/data/repo/category_section_repo_impl.dart' as _i894;
import '../../features/home/data/repo/meal_repo_impl.dart' as _i48;
import '../../features/home/data/repo/product_search_repository_Impl.dart'
    as _i360;
import '../../features/home/data/repo/recommended_meal_repo_impl.dart' as _i953;
import '../../features/home/domain/repo/category_section_repo.dart' as _i6;
import '../../features/home/domain/repo/meals_repository.dart' as _i91;
import '../../features/home/domain/repo/product_search_repository.dart'
    as _i719;
import '../../features/home/domain/repo/recommended_meal_repo.dart' as _i931;
import '../../features/home/domain/usecase/category_section_use_case.dart'
    as _i353;
import '../../features/home/domain/usecase/get_all_deals_use_case.dart'
    as _i893;
import '../../features/home/domain/usecase/get_products_search_use_case.dart'
    as _i301;
import '../../features/home/domain/usecase/recommended_meal_use_case.dart'
    as _i403;
import '../../features/home/presentation/cubit/cart_cubit.dart' as _i890;
import '../../features/home/presentation/cubit/category_cubit.dart' as _i458;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/home/presentation/cubit/product_search_cubit.dart'
    as _i28;
import '../../features/home/presentation/cubit/recommended_cubit.dart' as _i665;
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
    gh.factory<_i890.CartCubit>(() => _i890.CartCubit());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth());
    gh.factory<_i200.LoginRemoteDataSource>(
        () => _i544.LoginRemoteDataSourceImpl());
    gh.factory<_i318.Registerremotedatasource>(() =>
        _i979.Registerremotedatasourceimpl(apiManger: gh<_i1047.ApiManager>()));
    gh.factory<_i864.MealsRemoteDataSource>(
        () => _i227.MealsRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i0.LoginRepo>(
        () => _i176.LoginRepoImpl(gh<_i200.LoginRemoteDataSource>()));
    gh.factory<_i823.ProductRemoteDataSource>(
        () => _i704.ProductRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i836.Firebaseauthdatasource>(
        () => _i1020.Firebaseauthdatasourceimpl(auth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i195.RegisterRepository>(() => _i34.Registerrepositoryimpl(
        registerremotedatasource: gh<_i318.Registerremotedatasource>()));
    gh.factory<_i83.CategorySectionRemoteDataSource>(() =>
        _i1008.CategorySectionRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i494.RecommendedMealRemoteDataSource>(() =>
        _i71.RecommendedMealRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i91.MealRepository>(
        () => _i48.MealsRepositoryImpl(gh<_i864.MealsRemoteDataSource>()));
    gh.factory<_i630.LoginUseCase>(
        () => _i630.LoginUseCase(loginRepo: gh<_i0.LoginRepo>()));
    gh.factory<_i147.LoginCubit>(
        () => _i147.LoginCubit(gh<_i630.LoginUseCase>()));
    gh.factory<_i159.Firebaseauthrepository>(() =>
        _i867.Firebaseauthrepostioryimpl(
            datasource: gh<_i836.Firebaseauthdatasource>()));
    gh.factory<_i931.RecommendedMealRepo>(() => _i953.RecommendedMealRepoImpl(
        gh<_i494.RecommendedMealRemoteDataSource>()));
    gh.factory<_i600.RegisterUseCase>(() => _i600.RegisterUseCase(
        registerRepository: gh<_i195.RegisterRepository>()));
    gh.factory<_i719.ProductRepository>(
        () => _i360.ProductRepositoryImpl(gh<_i823.ProductRemoteDataSource>()));
    gh.factory<_i539.RegisterViewModel>(() =>
        _i539.RegisterViewModel(registerUseCase: gh<_i600.RegisterUseCase>()));
    gh.factory<_i6.CategorySectionRepo>(() => _i894.CategorySectionRepoImpl(
        gh<_i83.CategorySectionRemoteDataSource>()));
    gh.factory<_i893.GetAllDealsUseCase>(
        () => _i893.GetAllDealsUseCase(gh<_i91.MealRepository>()));
    gh.factory<_i403.RecommendedMealUseCase>(
        () => _i403.RecommendedMealUseCase(gh<_i931.RecommendedMealRepo>()));
    gh.factory<_i700.SignInWithGoogleUseCase>(() =>
        _i700.SignInWithGoogleUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithEmailUseCase>(
        () => _i700.SignInWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignUpWithEmailUseCase>(
        () => _i700.SignUpWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithFacebookUseCase>(() =>
        _i700.SignInWithFacebookUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i665.RecommendedCubit>(
        () => _i665.RecommendedCubit(gh<_i403.RecommendedMealUseCase>()));
    gh.factory<_i301.GetProductsSearchUseCase>(
        () => _i301.GetProductsSearchUseCase(gh<_i719.ProductRepository>()));
    gh.factory<_i700.AuthUseCases>(() => _i700.AuthUseCases(
          google: gh<_i700.SignInWithGoogleUseCase>(),
          email: gh<_i700.SignInWithEmailUseCase>(),
          signUp: gh<_i700.SignUpWithEmailUseCase>(),
          facebook: gh<_i700.SignInWithFacebookUseCase>(),
        ));
    gh.factory<_i353.CategorySectionUseCase>(
        () => _i353.CategorySectionUseCase(gh<_i6.CategorySectionRepo>()));
    gh.factory<_i917.FirebaseauthViewModel>(() =>
        _i917.FirebaseauthViewModel(authUseCases: gh<_i700.AuthUseCases>()));
    gh.factory<_i9.HomeCubit>(
        () => _i9.HomeCubit(gh<_i893.GetAllDealsUseCase>()));
    gh.factory<_i458.CategoryCubit>(
        () => _i458.CategoryCubit(gh<_i353.CategorySectionUseCase>()));
    gh.factory<_i28.ProductSearchCubit>(
        () => _i28.ProductSearchCubit(gh<_i301.GetProductsSearchUseCase>()));
    return this;
  }
}

class _$FirebaseModule extends _i35.FirebaseModule {}
