import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key, required this.transaction}) : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String detail = transaction.detail.toString();
    String amount = transaction.amount.toStringAsFixed(2);

    if (detail.length == 0) {
      detail = 'No detail provided';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Subtitle(
            text: "Transaction detail",
          ),
          SizedBox(height: 10),
          Text(
            detail,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: r'$',
                    style: TextStyle(color: Colors.grey[600], fontSize: 20)),
                TextSpan(
                    text: amount,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 40)),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: width,
            height: 50,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).errorColor),
              ),
              onPressed: () async {
                await Provider.of<BalanceModel>(context, listen: false)
                    .deleteTransactionById(transaction.id!);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete),
              label: Text('Delete'),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
