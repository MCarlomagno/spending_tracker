import 'package:spending_tracker/db/database.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:sqflite/sqflite.dart';

import '../setup.dart';

class TransactionsRepository {
  create(Payment payment) async {
    final DataBase dbProvider = getIt.get<DataBase>();
    Database? db = await dbProvider.database;
    var res = await db?.insert("Payments", payment.toMap());
    print(res.toString());
    return res;
  }
}
