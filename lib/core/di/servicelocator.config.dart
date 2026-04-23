// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/product_details/data/api/product_details_api.dart'
    as _i102;
import '../../feature/product_details/data/data_source/product_details_data_source.dart'
    as _i20;
import '../../feature/product_details/data/data_source/product_details_data_source_imp.dart'
    as _i748;
import '../../feature/product_details/data/repository/product_details_repo_imp.dart'
    as _i1000;
import '../../feature/product_details/domain/repository/product_details_repo.dart'
    as _i555;
import '../../feature/product_details/domain/use_case/add_to_cart_use_case.dart'
    as _i250;
import '../../feature/product_details/domain/use_case/product_details_use_case.dart'
    as _i837;
import '../../feature/product_details/domain/use_case/toggle_favorite_use_case.dart'
    as _i1013;
import '../../feature/product_details/presentation/view_model/product_details_cubit.dart'
    as _i54;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i102.ProductDetailsApi>(() => _i102.ProductDetailsApi());
    gh.factory<_i20.ProductDetailsDataSource>(
      () => _i748.ProductDetailsDataSourceImp(gh<_i102.ProductDetailsApi>()),
    );
    gh.factory<_i555.ProductDetailsRepository>(
      () => _i1000.ProductDetailsRepositoryImp(
        gh<_i20.ProductDetailsDataSource>(),
      ),
    );
    gh.factory<_i250.AddToCartUseCase>(
      () => _i250.AddToCartUseCase(gh<_i555.ProductDetailsRepository>()),
    );
    gh.factory<_i837.ProductDetailsUseCase>(
      () => _i837.ProductDetailsUseCase(gh<_i555.ProductDetailsRepository>()),
    );
    gh.factory<_i1013.ToggleFavoriteUseCase>(
      () => _i1013.ToggleFavoriteUseCase(gh<_i555.ProductDetailsRepository>()),
    );
    gh.factory<_i54.ProductDetailsCubit>(
      () => _i54.ProductDetailsCubit(
        gh<_i837.ProductDetailsUseCase>(),
        gh<_i1013.ToggleFavoriteUseCase>(),
        gh<_i250.AddToCartUseCase>(),
      ),
    );
    return this;
  }
}
