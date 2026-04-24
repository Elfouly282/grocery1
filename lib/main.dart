import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/my_list/presentation/view/my_list_view.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grocery App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<SmartListsCubit>()..fetchSmartLists(),
              ),
              BlocProvider(
                create: (context) => getIt<FavoritesCubit>()..fetchFavorites(),
              ),
              BlocProvider(
                create: (context) => getIt<HistoryCubit>()..fetchHistory(),
              ),
            ],
            child: const MyListView(),
          ),
        );
      },
    );
  }
}
