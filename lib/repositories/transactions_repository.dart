import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:sqflite/sqflite.dart';
import '../setup.dart';

class TransactionsRepository {
  Future<int?> create(Payment payment) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.insert("Payments", payment.toMap());
    return res;
  }

  Future<List<Payment>> getAll() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Payments");
    var allPayments =
        res?.map((e) => Payment.fromMap(e)).toList().reversed.toList();
    return allPayments ?? [];
  }

  Future<int?> deleteAll() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.delete("Payments");
    return res;
  }

  Future<Payment?> getById(int id) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Payments", where: 'id = ?', whereArgs: [id]);
    return Payment.fromMap(res![0]);
  }

  Future<void> updateById(int id, Payment payment) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    await db?.update("Payments", payment.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }
}
