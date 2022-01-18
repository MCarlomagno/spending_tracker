import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/constants/dimensions.dart';
import 'package:spending_tracker/models/balance_model.dart';
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

  _onCreateTransaction({required bool isMobile, required BuildContext context}) {
    final balanceModel = Provider.of<BalanceModel>(context, listen: false);

    Widget child = ListenableProvider.value(
      value: balanceModel,
      child: AddTransactionForm(),
    );

    if (isMobile) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => child,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => child,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var contentMarginVertical = 20.0;
    double maxWidth = 800.0;

    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < Dimensions.m;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BalanceModel>(
          create: (context) => BalanceModel(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: HomeAppBar(),
          body: SizedBox.expand(
            child: Center(
              child: Container(
                alignment: Alignment.topCenter,
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),
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
              _onCreateTransaction(isMobile: isMobile, context: context);
            },
            backgroundColor: Color(0xFF5BC8AA),
          ),
        );
      }),
    );
  }
}
