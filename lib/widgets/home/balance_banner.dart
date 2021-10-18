import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/transactions_model.dart';

class BalanceBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bannerWidth = MediaQuery.of(context).size.width * 0.9;
    const bannerHeight = 150.0;
    return Consumer<PaymentModel>(builder: (context, paymentsModel, child) {
      return Container(
        width: bannerWidth,
        height: bannerHeight,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[Color(0xFF5644A0), Color(0xFF2F8A7F), Color(0xFF14D928)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              r'$' + '${paymentsModel.balance}',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        ),
      );
    });
  }
}
