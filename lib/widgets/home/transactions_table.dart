import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/models/transactions_model.dart';

class TransactionsTable extends StatefulWidget {
  @override
  _TransactionsTableState createState() => _TransactionsTableState();
}

class _TransactionsTableState extends State<TransactionsTable> {
  @override
  Widget build(BuildContext context) {
    var tableHeight = MediaQuery.of(context).size.height * 0.4;
    var tableWidth = MediaQuery.of(context).size.width * 0.9;
    return Consumer<TransactionModel>(
        builder: (context, transactionModel, child) {
      List<Transaction> transactions = transactionModel.transactions;

      return Container(
        height: tableHeight,
        width: tableWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
              columns: [
                DataColumn(
                    label: Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Detail",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Amount",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
              rows: transactions.map<DataRow>((Transaction transaction) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        this._dateTimeFormatString(transaction.dateTime),
                      ),
                    ),
                    DataCell(
                      Text(transaction.detail ?? "no detail"),
                    ),
                    DataCell(
                      Text(
                        this._amountFormatString(transaction.amount),
                      ),
                    ),
                  ],
                );
              }).toList()),
        ),
      );
    });
  }

  _dateTimeFormatString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  _amountFormatString(double amount) {
    return "\$ " + amount.toStringAsFixed(2);
  }
}
