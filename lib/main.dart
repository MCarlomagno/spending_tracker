import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/home/home.dart';

import 'models/transactions_model.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending tracker',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: ChangeNotifierProvider(
        create: (context) => TransactionModel(),
        child: MyHomePage(),
      ),
    );
  }
}
