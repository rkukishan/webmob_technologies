import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webmob_technologies/data/app_exception.dart';
import 'package:webmob_technologies/models/user_model.dart';
import 'package:webmob_technologies/utils/app_variable.dart';

class ApiService {
  int page = 1;
  int results = 3;

  Future<UserModel> getData() async {
    final response = await http
        .put(Uri.parse("https://randomuser.me/api?page=${AppVariable.page}&results=3"))
        .timeout(const Duration(seconds: 30));

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      throw FetchDataException("Fetch data Exception");
    }
  }
}
