import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/widgets/home/transactions_table.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

import 'add_transaction_form.dart';
import 'app_bar.dart';
import 'balance_banner.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var contentMarginVertical = 20.0;
    return Scaffold(
      appBar: HomeAppBar(),
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: contentMarginVertical,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Subtitle(text: "Balance"),
                ),
                SizedBox(
                  height: contentMarginVertical,
                ),
                Align(
                  alignment: Alignment.center,
                  child: BalanceBanner(),
                ),
                SizedBox(
                  height: contentMarginVertical,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Subtitle(text: "Transactions"),
                ),
                SizedBox(
                  height: contentMarginVertical,
                ),
                TransactionsTable(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final paymentModel =
              Provider.of<PaymentModel>(context, listen: false);
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ListenableProvider.value(
                  value: paymentModel,
                  child: AddTransactionForm(),
                );
              });
        },
        backgroundColor: Color(0xFF5BC8AA),
        child: Icon(Icons.add),
      ),
    );
  }
}
