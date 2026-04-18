import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery1/features/list/data/data_sources/add_new_list_remote_data.dart';
import 'package:grocery1/features/list/data/repositories/add_new_list_repositoryImp.dart';
import 'package:grocery1/features/list/domain/repositories/add_new_list_repository.dart';
import 'package:grocery1/features/list/domain/usecases/add_new_list_usecase.dart';
import 'package:grocery1/features/list/presentation/cubit/list_cubit.dart';

final sl = GetIt.instance;

void init() {
  /// Cubit
  sl.registerFactory(
    () => SmartListCubit(
      sl(), // CreateSmartListUseCase
      sl(), // GetProductsUseCase
    ),
  );

  /// UseCases
  sl.registerLazySingleton(() => CreateNewListUseCase(sl()));
  sl.registerLazySingleton(() => GetAllListsUseCase(sl()));

  /// Repositories
  sl.registerLazySingleton<AddNewListRepository>(
    () => AddNewListRepositoryimpl(sl()),
  );

  /// Data Source
  sl.registerLazySingleton(() => AddNewListRemoteData(sl()));

  /// Dio
  sl.registerLazySingleton(() => Dio());
}
