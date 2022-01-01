import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:sqflite/sqflite.dart';
import '../setup.dart';

class BucketsRepository {
  Future<int?> create(Bucket bucket) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.insert("Bucket", bucket.toMap());
    return res;
  }

  Future<Bucket?> getById(int id) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Bucket", where: 'id = ?', whereArgs: [id]);
    return Bucket.fromMap(res![0]);
  }

  Future<List<Bucket>> getAll() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Bucket");
    var allBuckets =
        res?.map((e) => Bucket.fromMap(e)).toList().reversed.toList();
    return allBuckets ?? [];
  }

  Future<void> updateById(int id, Bucket bucket) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    await db
        ?.update("Bucket", bucket.toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> deleteById(int id) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.delete("Bucket", where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
