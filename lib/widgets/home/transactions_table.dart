import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/transactions_model.dart';

class TransactionsTable extends StatefulWidget {
  @override
  _TransactionsTableState createState() => _TransactionsTableState();
}

class _TransactionsTableState extends State<TransactionsTable> {
  @override
  Widget build(BuildContext context) {
    var tableHeight = MediaQuery.of(context).size.height * 0.4;
    return Consumer<TransactionModel>(
        builder: (context, transactionModel, child) {
      return Container(
        height: tableHeight,
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
            rows: [
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('10/10/2021')),
                  DataCell(Text('super')),
                  DataCell(Text(r'$2000')),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
