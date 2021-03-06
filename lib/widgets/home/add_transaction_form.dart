import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/button_progress.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class AddTransactionForm extends StatefulWidget {
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _paymentsService = getIt.get<PaymentsService>();

  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _detailController = new TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Subtitle(
            text: "New Transaction",
          ),
          SizedBox(height: 10),
          AppTextField(
            labelText: "Amount",
            keyboardType: TextInputType.number,
            controller: _amountController,
            autofocus: true,
          ),
          SizedBox(height: 10),
          AppTextField(
            labelText: "Description",
            controller: _detailController,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width - 60,
              color: Color(0xFF5BC8AA),
              disabledColor: Colors.grey[400],
              onPressed: !loading ? _onConfirmPressed : null,
              child: !loading
                  ? Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    )
                  : ButtonProgress(),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  _onConfirmPressed() async {
    _setLoading(true);
    try {
      await _createTransaction();
      Navigator.pop(context);
    } catch (err) {
      _setLoading(false);
    }
  }

  Future<void> _createTransaction() async {
    var amount = double.parse(this._amountController.text);
    var detail = this._detailController.text;
    var date = DateTime.now();

    var payment = new Payment(amount: amount, date: date, detail: detail);
    await _paymentsService.create(payment: payment);

    await Provider.of<PaymentModel>(context, listen: false).loadAll();
  }

  _setLoading(bool loading) {
    setState(() {
      this.loading = loading;
    });
  }

  @override
  void dispose() {
    this._amountController.dispose();
    this._detailController.dispose();
    super.dispose();
  }
}
