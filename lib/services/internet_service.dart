import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetService {
  Future<int> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return 1;
    } else {
      Get.snackbar("Internet", "No Internet Connection");
      return 0;
    }
  }
}
