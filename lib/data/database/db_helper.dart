import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webmob_technologies/utils/app_variable.dart';

class DbHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    var cdb = await initDB();
    return cdb;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, AppVariable.userDB);
    var appDb = await openDatabase(path, version: 1, onCreate: createDB);
    return appDb;
  }

  createDB(Database db, int version) async {
    await db.execute('''
    create table ${AppVariable.userTable} (
     ${AppVariable.userId} integer primary key autoincrement,
     ${AppVariable.userName} text,
     ${AppVariable.userEmail} text,
     ${AppVariable.userDob} text,
     ${AppVariable.userUsername} text,
    )
    ''');
  }
}
