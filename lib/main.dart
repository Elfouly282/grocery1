import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/list/presentation/cubit/list_cubit.dart';
import 'package:grocery1/features/list/presentation/screens/add_new_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🔥 init DI
  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<SmartListCubit>()..init(),
        child: const AddNewListScreen(),
      ),
    );
  }
}
