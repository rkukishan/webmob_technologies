import 'dart:async';
import 'package:get/get.dart';
import 'package:webmob_technologies/utils/app_routes/routes_name.dart';

class SplashService{
  void viewHold(){
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(RoutesName.home_view);
    });
  }
}