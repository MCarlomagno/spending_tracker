import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/interfaces/user.dart';
import 'package:sqflite/sqflite.dart';
import '../setup.dart';

class UsersRepository {
  Future<int?> create(User user) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.insert("Users", user.toMap());
    return res;
  }

  Future<User?> getSingle() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Users");
    return User.fromMap(res![0]);
  }

  Future<void> updateById(int id, User user) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    await db?.update("Users", user.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }
}
