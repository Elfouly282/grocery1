import 'package:flutter/material.dart';
import 'package:grocery1/core/routes/routes.dart';
import 'package:grocery1/features/productslist/presentation/screen/subcategory_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.products:
        return MaterialPageRoute(builder: (_) =>  ProductList());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
