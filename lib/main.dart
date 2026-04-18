import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/bloc_observer.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/routes/route_generator.dart';
import 'package:grocery1/core/routes/routes.dart';
import 'package:grocery1/features/category/presentation/cubit/subcategories_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setupLocator();
  runApp(Grocery());
}

class Grocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      ensureScreenSize: true,
      minTextAdapt: true,
      designSize: Size(402, 874),
      child: BlocProvider(
        create: (context) => servicelocator.get<SubcategoriesCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.products,
        ),
      ),
    );
  }
}
