import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:webmob_technologies/data/network/api_service.dart';
import 'package:webmob_technologies/models/user_db_model.dart';
import 'package:webmob_technologies/models/user_model.dart';
import 'package:webmob_technologies/repository/user_repository.dart';
import 'package:webmob_technologies/services/internet_service.dart';

class ApiController extends GetxController {
  ApiService apiService = ApiService();
  UserRepository userRepository = UserRepository();
  InternetService internetService = InternetService();

  RxBool isCheck = false.obs;
  RxList userList = [].obs;
  UserModel? userModel;

  void getApiData() async {
    isCheck.value = true;
    await apiService.getData().then((value) {
      userModel = value;
      isCheck.value = false;
    }).onError((error, stackTrace) {
      isCheck.value = true;
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  insertData(UserDbModel userDbModel) {
    userRepository.insertUser(userDbModel);
  }

  void getAllData() {
    userRepository.getData().then((value) {
      userList.assign(value);
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString());
    });
  }

  @override
  void onInit() async {
    var chkConnection = await internetService.checkInternet();
    if (chkConnection == 1) {
      getApiData();
    } else {
      getAllData();
    }
    super.onInit();
  }
}
