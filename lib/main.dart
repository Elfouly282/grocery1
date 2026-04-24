import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/servicelocator.dart';
import 'core/utils/my_bloc_observer.dart';

import 'features/signup/presentation/ui/auth/register_screen.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'SplashView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ✅ حماية من التكرار (fix duplicate-app)
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

  Bloc.observer = MyBlocObserver();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

          /// أول شاشة
          home: SplashView(),

          /// Routes
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            // RegisterScreen.routeName: (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}
