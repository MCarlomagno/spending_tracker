import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/models/transactions_model.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({Key? key, required this.payment}) : super(key: key);
  final Payment payment;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        children: [
          Text('Payment detail'),
          Text(payment.amount.toString()),
          Text(payment.detail.toString()),
          Spacer(),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).errorColor),
            ),
            onPressed: () async {
              await Provider.of<PaymentModel>(context, listen: false).deleteById(payment.id!);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete),
            label: Text('Delete'),
          )
        ],
      ),
    );
  }
}
