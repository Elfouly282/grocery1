import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/screens/home_screen.dart';
import 'package:grocery1/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:grocery1/features/my_list/presentation/view/my_list_view.dart';
import 'package:grocery1/features/my_list/presentation/view_model/favorites/favorites_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/history/history_cubit.dart';
import 'package:grocery1/features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart';
import 'package:grocery1/features/profile/presentation/views/profile_view.dart';

import 'core/di/servicelocator.dart';
import 'core/utils/my_bloc_observer.dart';

import 'features/signup/presentation/ui/auth/register_screen.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'SplashView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  Bloc.observer = MyBlocObserver();

  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Grocery App',
          // initialRoute: SplashView.routeName,

          /// أول شاشة
          home: SplashView(),

          /// Routes
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            // RegisterScreen.routeName: (context) => const RegisterScreen(),
            SplashView.routeName: (context) => SplashView()
          },
        );
      },
    );
  }
}
