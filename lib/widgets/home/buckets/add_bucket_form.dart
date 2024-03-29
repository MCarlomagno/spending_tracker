import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/constants/dimensions.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/shared/app_select_field.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/button_progress.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class AddBucketForm extends StatefulWidget {
  @override
  _AddBucketFormState createState() => _AddBucketFormState();
}

class _AddBucketFormState extends State<AddBucketForm> {
  final _bucketsService = getIt.get<BucketsService>();
  final _authenticationService = getIt.get<AuthenticationService>();

  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  TextEditingController _currencyController = new TextEditingController();

  bool loading = false;

  List<AppSelectOption> currencies = [
    AppSelectOption(label: '\$', value: '1'),
    AppSelectOption(label: 'AR\$', value: '2'),
    AppSelectOption(label: '€', value: '3'),
  ];

  _onCurrencyChanged(String? val) {
    AppSelectOption selected =
        currencies.firstWhere((element) => element.value == val);
    _currencyController = TextEditingController(text: selected.label);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double maxWidth = 400.0;

    bool isMobile = width < Dimensions.m;

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
            mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Subtitle(
                    text: "New Bucket",
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
              AppSelectField(
                labelText: "Currency",
                items: currencies,
                onChanged: _onCurrencyChanged,
              ),
              SizedBox(height: 10),
              AppTextField(
                labelText: "Name",
                controller: _nameController,
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
  }

  _onConfirmPressed() async {
    _setLoading(true);
    try {
      await _createBucket();
      Navigator.pop(context);
    } catch (err) {
      _setLoading(false);
    }
  }

  Future<void> _createBucket() async {
    var amount = double.parse(this._amountController.text);
    var name = this._nameController.text;
    var currency = this._currencyController.text;
    String uid = this._authenticationService.currentUser!.uid;

    var bucket = new Bucket(
      amount: amount,
      name: name,
      currency: currency,
      uid: uid,
    );
    await _bucketsService.create(bucket: bucket);

    await Provider.of<BalanceModel>(context, listen: false).loadAllBuckets();
  }

  _setLoading(bool loading) {
    setState(() {
      this.loading = loading;
    });
  }

  @override
  void dispose() {
    this._amountController.dispose();
    this._nameController.dispose();
    super.dispose();
  }
}
