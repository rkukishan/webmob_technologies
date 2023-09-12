import 'package:flutter/material.dart';
import 'package:webmob_technologies/utils/app_routes/routes.dart';
import 'package:webmob_technologies/utils/app_routes/routes_name.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splash_view,
      onGenerateRoute: Routes.ongenerateRoutes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
