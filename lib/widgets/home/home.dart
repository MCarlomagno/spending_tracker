import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/widgets/home/transactions_table.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

import 'add_transaction_form.dart';
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
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: contentMarginVertical,
              ),
              Subtitle(text: "Balance"),
              SizedBox(
                height: contentMarginVertical,
              ),
              BalanceBanner(),
              SizedBox(
                height: contentMarginVertical,
              ),
              Subtitle(text: "Transactions"),
              SizedBox(
                height: contentMarginVertical,
              ),
              TransactionsTable(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final paymentModel =
              Provider.of<PaymentModel>(context, listen: false);
          showModalBottomSheet(
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

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    var headerHeight = this.preferredSize.height;
    var contentWidth = MediaQuery.of(context).size.width * 0.8;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: headerHeight,
      actions: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
      title: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        width: contentWidth,
        height: headerHeight,
        child: Text(
          "Welcome back,\nMarcos",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
