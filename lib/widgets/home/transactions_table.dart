import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/services/transactions_service.dart';

import '../../setup.dart';

class TransactionsTable extends StatefulWidget {
  @override
  _TransactionsTableState createState() => _TransactionsTableState();
}

class _TransactionsTableState extends State<TransactionsTable> {
  final _paymentsService = getIt.get<PaymentsService>();

  @override
  void initState() {
    super.initState();
    _loadPayments();
  }

  _loadPayments() async {
    Provider.of<PaymentModel>(context, listen: false).loadAll();
  }

  @override
  Widget build(BuildContext context) {
    var tableHeight = MediaQuery.of(context).size.height * 0.4;
    var tableWidth = MediaQuery.of(context).size.width;
    return Consumer<PaymentModel>(builder: (context, paymentsModel, child) {
      List<Payment> transactions = paymentsModel.payments;

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
              rows: transactions.map<DataRow>((Payment payment) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        this._dateTimeFormatString(payment.date),
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        controller: TextEditingController(
                            text: payment.detail ?? "no detail"),
                        onFieldSubmitted: (val) async {
                          await _paymentsService.patchById(payment.id ?? 0,
                              detail: val);
                          await paymentsModel.loadAll();
                        },
                      ),
                    ),
                    DataCell(
                      Container(
                        child: Text(
                          this._amountFormatString(payment.amount),
                        ),
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
    return "\$ " + amount.toStringAsFixed(0);
  }
}
