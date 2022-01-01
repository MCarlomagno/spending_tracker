import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/utils/utils.dart';
import 'package:spending_tracker/widgets/home/transactions/payment_detail.dart';
import '../../../setup.dart';

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
    Provider.of<BalanceModel>(context, listen: false).loadAllPayments();
  }

  @override
  Widget build(BuildContext context) {
    var tableHeight = MediaQuery.of(context).size.height * 0.4;
    var tableWidth = MediaQuery.of(context).size.width;
    return Consumer<BalanceModel>(builder: (context, balanceModel, child) {
      List<Payment> transactions = balanceModel.payments;

      return Container(
        height: tableHeight,
        width: tableWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
              showCheckboxColumn: false,
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
                  onSelectChanged: (val) {
                    final balanceModel =
                        Provider.of<BalanceModel>(context, listen: false);
                    showModalBottomSheet(
                        backgroundColor: Theme.of(context).backgroundColor,
                        context: context,
                        builder: (BuildContext context) {
                          return ListenableProvider.value(
                            value: balanceModel,
                            child: PaymentDetail(payment: payment),
                          );
                        });
                  },
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
                          await balanceModel.loadAllPayments();
                        },
                      ),
                    ),
                    DataCell(
                      Container(
                        child: Text(
                          payment.amount.toStringAsFixed(0),
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
}
