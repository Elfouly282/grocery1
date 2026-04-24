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

import '../../features/subcategories/data/repositories/datasoures/remoteDataSourses/categories_datasource_impl.dart'
    as _i10;
import '../../features/subcategories/data/repositories/datasoures/remoteDataSourses/category_details_datasource_Ipml.dart'
    as _i213;
import '../../features/subcategories/data/repositories/repositories/categories_repository_Impl.dart'
    as _i237;
import '../../features/subcategories/data/repositories/repositories/category_details_repository_Impl.dart'
    as _i103;
import '../../features/subcategories/domain/repositories/datasourses/remoteDataSourse/categories_datasource.dart'
    as _i1062;
import '../../features/subcategories/domain/repositories/datasourses/remoteDataSourse/category_details_datasource.dart'
    as _i442;
import '../../features/subcategories/domain/repositories/repositories/categories_repository.dart'
    as _i257;
import '../../features/subcategories/domain/repositories/repositories/category_details_repository.dart'
    as _i893;
import '../../features/subcategories/domain/usecases/categories_usecase.dart'
    as _i245;
import '../../features/subcategories/domain/usecases/category_details_usecase.dart'
    as _i587;
import '../../features/subcategories/presentation/cubit/categories_view_model.dart'
    as _i616;
import '../../features/subcategories/presentation/cubit/category_details_view_model.dart'
    as _i810;
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
    gh.factory<_i442.CategoryDetailsDatasource>(
      () => _i213.CategoryDetailsDataSourceImpl(
        apiManger: gh<_i1047.ApiManger>(),
      ),
    );
    gh.factory<_i1062.CategoriesDataSource>(
      () => _i10.CategoriesDataSourceImpl(apiManger: gh<_i1047.ApiManger>()),
    );
    gh.factory<_i893.CategoryDetailsRepository>(
      () => _i103.Categorydetailsrepositoryimpl(
        datasource: gh<_i442.CategoryDetailsDatasource>(),
      ),
    );
    gh.factory<_i587.CategoryDetailsUseCase>(
      () => _i587.CategoryDetailsUseCase(
        categoryDetails: gh<_i893.CategoryDetailsRepository>(),
      ),
    );
    gh.factory<_i257.Categoriesrepository>(
      () => _i237.CategoriesRepositoryImpl(
        dataSource: gh<_i1062.CategoriesDataSource>(),
      ),
    );
    gh.factory<_i245.CategoriesUseCase>(
      () => _i245.CategoriesUseCase(
        categoriesrepository: gh<_i257.Categoriesrepository>(),
      ),
    );
    gh.factory<_i810.CategoryDetailsViewModel>(
      () => _i810.CategoryDetailsViewModel(
        categoryDetailsUseCase: gh<_i587.CategoryDetailsUseCase>(),
      ),
    );
    gh.factory<_i616.CategoriesViewModel>(
      () => _i616.CategoriesViewModel(
        categoriesUseCase: gh<_i245.CategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i140.FirebaseModule {}
