import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/servicelocator.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/login/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCyERp8WmKVVMrYNTXVg1zuUMFVfq85-nM",
      appId: "1:908633982306:android:bfa483aa25957ce35f983b",
      messagingSenderId: "908633982306",
      projectId: "grocrey1",
    ),
  );
  await configureDependencies();
  runApp(MyApp());
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
initialRoute: HomeScreen.routeName,
          routes: {
            LoginScreen.routeName:(context)=>LoginScreen(),
            HomeScreen.routeName:(context)=>HomeScreen(),

          },
                 );
      },
    );
  }
}
