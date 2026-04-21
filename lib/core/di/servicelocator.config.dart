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
import '../../Features/SubCategories/domain/repositories/repositories/CategoriesRepository.dart'
    as _i749;
import '../../Features/SubCategories/domain/repositories/repositories/CategoryDetailsRepository.dart'
    as _i378;
import '../../Features/SubCategories/domain/usecases/CategoriesUseCase.dart'
    as _i941;
import '../../Features/SubCategories/domain/usecases/CategoryDetailsUseCase.dart'
    as _i46;
import '../../Features/SubCategories/presentation/ui/SubCatergories/Cubit/Categories_View_Model.dart'
    as _i759;
import '../../Features/SubCategories/presentation/ui/SubCatergories/Cubit/CategoryDetails_View_Model.dart'
    as _i682;
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
    gh.factory<_i1000.CategoriesDataSource>(
      () => _i50.CategoriesDataSourceImpl(apiManger: gh<_i1047.ApiManger>()),
    );
    gh.factory<_i24.CategoryDetailsDatasource>(
      () => _i188.CategoryDetailsDataSourceImpl(
        apiManger: gh<_i1047.ApiManger>(),
      ),
    );
    gh.factory<_i749.Categoriesrepository>(
      () => _i948.CategoriesRepositoryImpl(
        dataSource: gh<_i1000.CategoriesDataSource>(),
      ),
    );
    gh.factory<_i941.CategoriesUseCase>(
      () => _i941.CategoriesUseCase(
        categoriesrepository: gh<_i749.Categoriesrepository>(),
      ),
    );
    gh.factory<_i759.CategoriesViewModel>(
      () => _i759.CategoriesViewModel(
        categoriesUseCase: gh<_i941.CategoriesUseCase>(),
      ),
    );
    gh.factory<_i378.CategoryDetailsRepository>(
      () => _i500.Categorydetailsrepositoryimpl(
        datasource: gh<_i24.CategoryDetailsDatasource>(),
      ),
    );
    gh.factory<_i46.CategoryDetailsUseCase>(
      () => _i46.CategoryDetailsUseCase(
        categoryDetails: gh<_i378.CategoryDetailsRepository>(),
      ),
    );
    gh.factory<_i682.CategoryDetailsViewModel>(
      () => _i682.CategoryDetailsViewModel(
        categoryDetailsUseCase: gh<_i46.CategoryDetailsUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i140.FirebaseModule {}
