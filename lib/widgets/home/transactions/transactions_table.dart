import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/widgets/home/transactions/transaction_detail.dart';
import '../../../setup.dart';

class TransactionsTable extends StatefulWidget {
  @override
  _TransactionsTableState createState() => _TransactionsTableState();
}

class _TransactionsTableState extends State<TransactionsTable> {
  final _transactionsService = getIt.get<TransactionsService>();

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  _loadTransactions() async {
    Provider.of<BalanceModel>(context, listen: false).loadAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = 800.0;
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height * 0.4;
    return Consumer<BalanceModel>(builder: (context, balanceModel, child) {
      List<Transaction> transactions = balanceModel.transactions;

      return Center(
        child: Container(
          height: containerHeight,
          width: containerWidth,
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
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
                rows: transactions.map<DataRow>((Transaction transaction) {
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
                              child: TransactionDetail(transaction: transaction),
                            );
                          });
                    },
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          this._dateTimeFormatString(transaction.date),
                        ),
                      ),
                      DataCell(
                        TextFormField(
                          controller: TextEditingController(
                              text: transaction.detail ?? "no detail"),
                          onFieldSubmitted: (val) async {
                            await _transactionsService.patchById(transaction.id!,
                                detail: val);
                            await balanceModel.loadAllTransactions();
                          },
                        ),
                      ),
                      DataCell(
                        Container(
                          child: Text(
                            transaction.amount.toStringAsFixed(0),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList()),
          ),
        ),
      );
    });
  }

  _dateTimeFormatString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
