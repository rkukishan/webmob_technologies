import 'package:flutter/material.dart';
import 'package:webmob_technologies/res/app_color.dart';
import 'package:webmob_technologies/services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    splashService.viewHold();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.ac_unit,
        size: 100,
        color: redColor,
      ),
    );
  }
}
