import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/constants/dimensions.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/shared/app_select_field.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/button_progress.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

enum TransactionType { Income, Expense }

class AddTransactionForm extends StatefulWidget {
  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _transactionService = getIt.get<TransactionsService>();
  final _authenticationService = getIt.get<AuthenticationService>();
  final _bucketsService = getIt.get<BucketsService>();

  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _detailController = new TextEditingController();

  bool loading = false;

  List<bool> _selected = [false, true];
  TransactionType _type = TransactionType.Expense;

  List<AppSelectOption> bucketOptions = [];
  AppSelectOption? selectedBucket;

  _onTypeSelected(int index) {
    _selected = [false, false];

    if (index == 0)
      _type = TransactionType.Income;
    else
      _type = TransactionType.Expense;

    setState(() {
      _selected[index] = true;
    });
  }

  _onBucketSelected(String? value) {
    selectedBucket = bucketOptions.firstWhere((b) => b.value == value);
    print(selectedBucket!.label);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceModel>(builder: (context, balanceModel, child) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      double maxWidth = 400.0;

      bool isMobile = width < Dimensions.m;

      List<Bucket> buckets = balanceModel.buckets;
      bucketOptions = buckets
          .map((b) => AppSelectOption(value: b.id!, label: b.name!))
          .toList();

      return Center(
        child: Card(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            height: isMobile ? height : null,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Subtitle(
                      text: "New Transaction",
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AppTextField(
                  labelText: "Amount",
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  autofocus: true,
                ),
                SizedBox(height: 10),
                ToggleButtons(
                  children: [
                    Container(
                      child: Text(
                        'Income',
                        textAlign: TextAlign.center,
                      ),
                      width: 100,
                    ),
                    Container(
                      child: Text(
                        'Expense',
                        textAlign: TextAlign.center,
                      ),
                      width: 100,
                    )
                  ],
                  isSelected: _selected,
                  onPressed: _onTypeSelected,
                ),
                SizedBox(height: 10),
                AppSelectField(
                  labelText: "Buacket",
                  items: bucketOptions,
                  onChanged: _onBucketSelected,
                ),
                SizedBox(height: 10),
                AppTextField(
                  labelText: "Description",
                  controller: _detailController,
                ),
                SizedBox(height: 20),
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
          ),
        ),
      );
    });
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
    if (_type == TransactionType.Expense) amount = (-amount);

    var detail = this._detailController.text;
    var date = DateTime.now();
    String uid = _authenticationService.currentUser!.uid;

    var transaction =
        new Transaction(amount: amount, date: date, detail: detail, uid: uid);

    await _transactionService.create(transaction: transaction);
    await Provider.of<BalanceModel>(context, listen: false)
        .loadAllTransactions();

    if (selectedBucket != null) {
      await _bucketsService.changeAmount(selectedBucket!.value, amount: amount);
      await Provider.of<BalanceModel>(context, listen: false).loadAllBuckets();
    }
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
