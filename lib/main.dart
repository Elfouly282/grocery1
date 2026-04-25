import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/screens/testscreen.dart';
import 'package:grocery1/features/subcategories/presentation/sub_categories_screen.dart';
import 'package:grocery1/main_app.dart';
import 'core/di/servicelocator.dart';
import 'core/utils/my_bloc_observer.dart';
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
          home: MainApp(),
          /// Routes
          routes: {
            SubCategoriesScreen.routeName: (context) => SubCategoriesScreen(),
            testscreen.routeName: (context) => testscreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            // RegisterScreen.routeName: (context) => const RegisterScreen(),
            SplashView.routeName: (context) => SplashView()
          },
        );
      },
    );
  }
}
