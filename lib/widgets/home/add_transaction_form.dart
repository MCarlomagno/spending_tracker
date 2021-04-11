import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class AddTransactionForm extends StatefulWidget {
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _transactionsService = getIt.get<TransactionsService>();

  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _detailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Subtitle(
            text: "New Transaction",
          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Amount",
            keyboardType: TextInputType.number,
            controller: _amountController,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextField(
            labelText: "Description",
            controller: _detailController,
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            height: 50,
            minWidth: MediaQuery.of(context).size.width - 60,
            color: Color(0xFF5BC8AA),
            onPressed: () async {
              await _createTransaction();
              Navigator.pop(context);
            },
            child: Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _createTransaction() async {
    var amount = double.parse(this._amountController.text);
    var detail = this._detailController.text;
    var dateTime = DateTime.now();
    var transaction =
        new Transaction(amount: amount, dateTime: dateTime, detail: detail);
    await _transactionsService.create(transaction: transaction);
    Provider.of<TransactionModel>(context, listen: false).add(transaction);
  }

  @override
  void dispose() {
    this._amountController.dispose();
    this._detailController.dispose();
    super.dispose();
  }
}
