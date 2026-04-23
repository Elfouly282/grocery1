import 'package:get_it/get_it.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/home/data/data_source/recommended_meal_remote_data_source.dart';
import 'package:grocery1/features/home/data/data_source/recommended_meal_remote_data_source_impl.dart';
import 'package:grocery1/features/home/data/repo/meal_repo_impl.dart';
import 'package:grocery1/features/home/data/repo/recommended_meal_repo_impl.dart';
import 'package:grocery1/features/home/domain/repo/meals_repository.dart';
import 'package:grocery1/features/home/domain/repo/recommended_meal_repo.dart';
import 'package:grocery1/features/home/domain/usecase/get_all_deals_use_case.dart';
import 'package:grocery1/features/home/domain/usecase/recommended_meal_use_case.dart';
import 'package:grocery1/features/home/presentation/cubit/recommended_cubit.dart';

import '../../features/home/data/data_source/category_section_remote_data_source.dart';
import '../../features/home/data/data_source/category_section_remote_data_source_impl.dart';
import '../../features/home/data/data_source/meals_remote_data_source.dart';
import '../../features/home/data/data_source/meals_remote_data_source_impl.dart';
import '../../features/home/data/repo/category_section_repo_impl.dart';
import '../../features/home/domain/repo/category_section_repo.dart';
import '../../features/home/domain/usecase/category_section_use_case.dart';
import '../../features/home/presentation/cubit/category_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/login/data/data_Source/login_remote_data_source.dart';
import '../../features/login/data/data_Source/login_remote_data_source_impl.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/login/domain/useCase/login_use_case.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';

final getit = GetIt.instance;

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<ApiManager>(
        () => ApiManager(),
  );

  getIt.registerLazySingleton<MealsRemoteDataSource>(
        () => MealsRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<MealRepository>(
        () => MealsRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<GetAllDealsUseCase>(
        () => GetAllDealsUseCase(getIt()),
  );

  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(getIt()),
  );

  getIt.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(loginRepo: getIt()),
  );

  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(getIt()),
  );

  getIt.registerLazySingleton<RecommendedMealRemoteDataSource>(
        () => RecommendedMealRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<RecommendedMealRepo>(
        () => RecommendedMealRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<RecommendedMealUseCase>(
        () => RecommendedMealUseCase(getIt()),
  );

  getIt.registerFactory<RecommendedCubit>(
        () => RecommendedCubit(getIt()),
  );


  getIt.registerLazySingleton<CategorySectionRemoteDataSource>(
        () => CategorySectionRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<CategorySectionRepo>(
        () => CategorySectionRepoImpl(getIt()),
  );

  getIt.registerLazySingleton<CategorySectionUseCase>(
        () => CategorySectionUseCase(getIt()),
  );

  getIt.registerFactory<CategoryCubit>(
        () => CategoryCubit(getIt()),
  );
}