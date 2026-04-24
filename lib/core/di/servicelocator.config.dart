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

import '../../features/my_list/data/api/my_list_api.dart' as _i814;
import '../../features/my_list/data/datasources/add_to_cart/add_to_cart_data_source.dart'
    as _i814;
import '../../features/my_list/data/datasources/add_to_cart/add_to_cart_data_source_imp.dart'
    as _i294;
import '../../features/my_list/data/datasources/favorites/favorites_data_source.dart'
    as _i958;
import '../../features/my_list/data/datasources/favorites/favorites_data_source_imp.dart'
    as _i453;
import '../../features/my_list/data/datasources/history/history_data_source.dart'
    as _i399;
import '../../features/my_list/data/datasources/history/history_data_source_imp.dart'
    as _i1038;
import '../../features/my_list/data/datasources/smart_list/smart_list_data_source.dart'
    as _i295;
import '../../features/my_list/data/datasources/smart_list/smart_list_data_source_imp.dart'
    as _i35;
import '../../features/my_list/data/repositories/add_to_cart/add_to_cart_repository_imp.dart'
    as _i768;
import '../../features/my_list/data/repositories/favorites/favorites_repository_imp.dart'
    as _i991;
import '../../features/my_list/data/repositories/history/history_repository_imp.dart'
    as _i820;
import '../../features/my_list/data/repositories/smart_list/smart_list_repository_imp.dart'
    as _i587;
import '../../features/my_list/domain/repository/add_to_cart/add_to_cart_repository.dart'
    as _i790;
import '../../features/my_list/domain/repository/favorites/favorites_repository.dart'
    as _i953;
import '../../features/my_list/domain/repository/history/history_repository.dart'
    as _i416;
import '../../features/my_list/domain/repository/smart_list/smart_list_repository.dart'
    as _i575;
import '../../features/my_list/domain/use_case/favoriets/add_to_cart_use_case.dart'
    as _i298;
import '../../features/my_list/domain/use_case/favoriets/get_favorites_use_case.dart'
    as _i319;
import '../../features/my_list/domain/use_case/favoriets/remove_favorites_use_case.dart'
    as _i38;
import '../../features/my_list/domain/use_case/history/add_remove_favorites.dart'
    as _i283;
import '../../features/my_list/domain/use_case/history/add_to_cart_use_case.dart'
    as _i880;
import '../../features/my_list/domain/use_case/history/get_history_use_case.dart'
    as _i275;
import '../../features/my_list/domain/use_case/smart_list/add_all_to_cart_use_case.dart'
    as _i576;
import '../../features/my_list/domain/use_case/smart_list/delete_smart_list_use_case.dart'
    as _i1017;
import '../../features/my_list/domain/use_case/smart_list/get_smart_lists_use_case.dart'
    as _i655;
import '../../features/my_list/presentation/view_model/favorites/favorites_cubit.dart'
    as _i944;
import '../../features/my_list/presentation/view_model/history/history_cubit.dart'
    as _i727;
import '../../features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart'
    as _i218;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i814.MyListApi>(() => _i814.MyListApi());
    gh.factory<_i399.HistoryDataSource>(
      () => _i1038.HistoryDataSourceImpl(gh<_i814.MyListApi>()),
    );
    gh.factory<_i814.AddToCartDataSource>(
      () => _i294.AddToCartDataSourceImp(gh<_i814.MyListApi>()),
    );
    gh.factory<_i35.SmartListDataSource>(
      () => _i295.SmartListDataSourceImpl(gh<_i814.MyListApi>()),
    );
    gh.factory<_i958.FavoritesDataSource>(
      () => _i453.FavoritesDataSourceImpl(gh<_i814.MyListApi>()),
    );
    gh.factory<_i790.AddToCartRepository>(
      () => _i768.AddToCartRepositoryImp(gh<_i814.AddToCartDataSource>()),
    );
    gh.factory<_i416.HistoryRepository>(
      () => _i820.HistoryRepositoryImpl(gh<_i399.HistoryDataSource>()),
    );
    gh.factory<_i575.SmartListRepository>(
      () => _i587.SmartListRepositoryImpl(gh<_i35.SmartListDataSource>()),
    );
    gh.factory<_i283.AddRemoveFavoritesUseCase>(
      () => _i283.AddRemoveFavoritesUseCase(gh<_i416.HistoryRepository>()),
    );
    gh.factory<_i275.GetHistoryUseCase>(
      () => _i275.GetHistoryUseCase(gh<_i416.HistoryRepository>()),
    );
    gh.factory<_i298.AddToCartFavoritesUseCase>(
      () => _i298.AddToCartFavoritesUseCase(gh<_i790.AddToCartRepository>()),
    );
    gh.factory<_i880.AddToCartHistoryUseCase>(
      () => _i880.AddToCartHistoryUseCase(gh<_i790.AddToCartRepository>()),
    );
    gh.factory<_i576.AddToCartSmartListUseCase>(
      () => _i576.AddToCartSmartListUseCase(gh<_i790.AddToCartRepository>()),
    );
    gh.factory<_i953.FavoritesRepository>(
      () => _i991.FavoritesRepositoryImpl(gh<_i958.FavoritesDataSource>()),
    );
    gh.factory<_i727.HistoryCubit>(
      () => _i727.HistoryCubit(
        gh<_i275.GetHistoryUseCase>(),
        gh<_i283.AddRemoveFavoritesUseCase>(),
        gh<_i880.AddToCartHistoryUseCase>(),
      ),
    );
    gh.factory<_i319.GetFavoritesUseCase>(
      () => _i319.GetFavoritesUseCase(gh<_i953.FavoritesRepository>()),
    );
    gh.factory<_i38.AddAndRemoveFavoriteUseCase>(
      () => _i38.AddAndRemoveFavoriteUseCase(gh<_i953.FavoritesRepository>()),
    );
    gh.factory<_i1017.DeleteSmartListUseCase>(
      () => _i1017.DeleteSmartListUseCase(gh<_i575.SmartListRepository>()),
    );
    gh.factory<_i655.GetSmartListsUseCase>(
      () => _i655.GetSmartListsUseCase(gh<_i575.SmartListRepository>()),
    );
    gh.factory<_i218.SmartListsCubit>(
      () => _i218.SmartListsCubit(
        gh<_i655.GetSmartListsUseCase>(),
        gh<_i1017.DeleteSmartListUseCase>(),
        gh<_i576.AddToCartSmartListUseCase>(),
      ),
    );
    gh.factory<_i944.FavoritesCubit>(
      () => _i944.FavoritesCubit(
        gh<_i319.GetFavoritesUseCase>(),
        gh<_i38.AddAndRemoveFavoriteUseCase>(),
        gh<_i298.AddToCartFavoritesUseCase>(),
      ),
    );
    return this;
  }
}
