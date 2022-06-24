import 'package:filmhub/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'examplee.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id TEXT , name TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertUsers(List<HubUser> hubuser) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in hubuser) {
      result = await db.insert('users', user.toJson());
    }
    return result;
  }

  Future<List<HubUser>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => HubUser.fromJson(e)).toList();
  }

  void updateUsers(HubUser hubuser) async {
    final Database db = await initializeDB();
    db.update('users', hubuser.toJson());
  }
}
