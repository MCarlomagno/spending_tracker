import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/models/users_model.dart';
import 'package:spending_tracker/widgets/home/buckets/buckets_list.dart';
import 'package:spending_tracker/widgets/home/transactions/transactions_table.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

import 'transactions/add_transaction_form.dart';
import 'app_bar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var contentMarginVertical = 20.0;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BalanceModel>(
          create: (context) => BalanceModel(),
        ),
        ChangeNotifierProvider<UsersModel>(
          create: (context) => UsersModel(),
        ),
      ],
      child: Builder(builder: (context) {
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
                      child: Subtitle(text: "Buckets"),
                    ),
                    SizedBox(
                      height: contentMarginVertical,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: BucketsList(),
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
          floatingActionButton: FloatingActionButton.extended(
            label: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                  TextSpan(text: 'NEW TRANSACTION'),
                ],
              ),
            ),
            onPressed: () {
              final balanceModel =
                  Provider.of<BalanceModel>(context, listen: false);
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return ListenableProvider.value(
                          value: balanceModel,
                          child: AddTransactionForm(),
                        );
                      },
                    );
                  });
            },
            backgroundColor: Color(0xFF5BC8AA),
          ),
        );
      }),
    );
  }
}
