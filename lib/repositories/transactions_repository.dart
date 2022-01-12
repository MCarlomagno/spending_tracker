import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/interfaces/transaction.dart' as model;
import 'package:sqflite/sqflite.dart';
import '../setup.dart';

class TransactionsRepository {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

  Future<int?> create(model.Transaction transactin) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.insert("Payments", transactin.toMap());
    return res;
  }

  Future<List<model.Transaction>> getAll() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Payments");
    var allPayments = res
        ?.map((e) => model.Transaction.fromMap(e))
        .toList()
        .reversed
        .toList();
    return allPayments ?? [];
  }

  Future<int?> deleteAll() async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.delete("Payments");
    return res;
  }

  Future<int?> deleteById(int id) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.delete("Payments", where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<model.Transaction?> getById(int id) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    var res = await db?.query("Payments", where: 'id = ?', whereArgs: [id]);
    return model.Transaction.fromMap(res![0]);
  }

  Future<void> updateById(int id, model.Transaction payment) async {
    final DatabaseProvider dbProvider = getIt.get<DatabaseProvider>();
    Database? db = await dbProvider.database;
    await db
        ?.update("Payments", payment.toMap(), where: 'id = ?', whereArgs: [id]);
  }
}
