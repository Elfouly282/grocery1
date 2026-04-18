// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:grocery1/core/api/api_manager.dart' as _i820;
import 'package:grocery1/core/di/register_model.dart' as _i267;
import 'package:grocery1/features/category/data/data_source/api_datasource.dart'
    as _i642;
import 'package:grocery1/features/category/data/data_source/subcategory_datasource.dart'
    as _i839;
import 'package:grocery1/features/category/data/repository/subcate_repositoryimpl.dart'
    as _i522;
import 'package:grocery1/features/category/domain/repo/subcate_repository.dart'
    as _i1050;
import 'package:grocery1/features/category/domain/usecase/getsubcate_usecase.dart'
    as _i535;
import 'package:grocery1/features/category/domain/usecase/getsubcategorydetails_usecase.dart'
    as _i486;
import 'package:grocery1/features/category/presentation/cubit/subcategories_cubit.dart'
    as _i536;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.storage(),
    );
    gh.lazySingleton<_i820.ApiManger>(
      () => _i820.ApiManger(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i839.SubcategoryDatasource>(
      () => _i642.ApiDatasource(api: gh<_i820.ApiManger>()),
    );
    gh.lazySingleton<_i1050.SubcategoryRepository>(
      () => _i522.SubcateRepositoryimpl(
        subcategoryDatasource: gh<_i839.SubcategoryDatasource>(),
      ),
    );
    gh.lazySingleton<_i535.GetSubcategoriesUseCase>(
      () => _i535.GetSubcategoriesUseCase(
        subcaterepository: gh<_i1050.SubcategoryRepository>(),
      ),
    );
    gh.lazySingleton<_i486.GetsubcategorydetailsUsecase>(
      () => _i486.GetsubcategorydetailsUsecase(
        subcategoryrepository: gh<_i1050.SubcategoryRepository>(),
      ),
    );
    gh.singleton<_i536.SubcategoriesCubit>(
      () => _i536.SubcategoriesCubit(
        gh<_i535.GetSubcategoriesUseCase>(),
        gh<_i486.GetsubcategorydetailsUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i267.RegisterModule {}
