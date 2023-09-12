import 'package:webmob_technologies/data/database/db_helper.dart';
import 'package:webmob_technologies/models/user_db_model.dart';
import 'package:webmob_technologies/utils/app_variable.dart';

class UserRepository {
  DbHelper dbHelper = DbHelper();

  Future<int> insertUser(UserDbModel userDbModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.insert(AppVariable.userTable, userDbModel.toMap());
  }

  Future<List<UserDbModel>> getData() async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> queryResult =
        await dbClient.query(AppVariable.userTable);
    print("qr $queryResult");
    return queryResult.map((e) => UserDbModel.fromMap(e)).toList();
  }
}
