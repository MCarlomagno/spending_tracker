import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/button_progress.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class AddBucketForm extends StatefulWidget {
  @override
  _AddBucketFormState createState() => _AddBucketFormState();
}

class _AddBucketFormState extends State<AddBucketForm> {
  final _bucketsService = getIt.get<BucketsService>();

  final TextEditingController _amountController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();

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
            text: "New Bucket",
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
            labelText: "name",
            controller: _nameController,
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
      await _createBucket();
      Navigator.pop(context);
    } catch (err) {
      _setLoading(false);
    }
  }

  Future<void> _createBucket() async {
    var amount = double.parse(this._amountController.text);
    var name = this._nameController.text;

    var bucket = new Bucket(amount: amount, name: name);
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
