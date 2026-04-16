import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/routes/route_generator.dart';
import 'package:grocery1/core/routes/routes.dart';

void main() {
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.products,
      ),
    );
  }
}
