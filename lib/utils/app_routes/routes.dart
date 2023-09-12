import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webmob_technologies/utils/app_routes/routes_name.dart';
import 'package:webmob_technologies/view/home_view.dart';
import 'package:webmob_technologies/view/splash_view.dart';

class Routes {
  static Route<dynamic> ongenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home_view:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );

      case RoutesName.splash_view:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("Route Not Found"),
            ),
          ),
        );
    }
  }
}
