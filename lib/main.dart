import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/feature/product_details/presentation/view/product_details_screen.dart';
import 'package:grocery1/feature/product_details/presentation/view_model/product_details_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: BlocProvider(
        create: (context) => getIt<ProductDetailsCubit>()..getProductDetails(1),
        child: const ProductDetailsScreen(),
      ),
    );
  }
}
