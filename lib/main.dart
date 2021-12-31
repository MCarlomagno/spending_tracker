import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/models/users_model.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/home/home.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending tracker',
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25.0))),
          ),
          errorColor: Colors.red,
          backgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins'),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<BalanceModel>(
            create: (context) => BalanceModel(),
          ),
          ChangeNotifierProvider<UsersModel>(
            create: (context) => UsersModel(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
