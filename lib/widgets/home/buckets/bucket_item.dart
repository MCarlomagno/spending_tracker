import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'dart:math' as math;

import 'package:spending_tracker/utils/utils.dart';
import 'package:spending_tracker/widgets/home/buckets/bucket_amount.dart';
import 'package:spending_tracker/widgets/home/buckets/bucket_detail.dart';
import 'package:spending_tracker/widgets/home/buckets/bucket_title.dart';

class BucketItem extends StatelessWidget {
  final Bucket bucket;
  const BucketItem({Key? key, required this.bucket}) : super(key: key);

  _onBucketPressed(BuildContext context) {
    final balanceModel = Provider.of<BalanceModel>(context, listen: false);
    showModalBottomSheet(
        backgroundColor: Theme.of(context).backgroundColor,
        context: context,
        builder: (BuildContext context) {
          return ListenableProvider.value(
            value: balanceModel,
            child: BucketDetail(bucket: bucket),
          );
        });
  }

  _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(.3);
  }

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width / 4;
    return InkWell(
      onTap: () => {_onBucketPressed(context)},
      child: Container(
        height: 150.0,
        width: itemWidth,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              _getRandomColor(),
              _getRandomColor(),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bucket.name != null
                ? BucketTitle(title: bucket.name!)
                : BucketTitle(title: 'Unnamed'),
            BucketAmount(
              amount: Utils.amountFormatString(bucket.amount),
            )
          ],
        ),
      ),
    );
  }
}
