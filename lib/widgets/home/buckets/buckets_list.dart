import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/widgets/home/buckets/add_bucket_form.dart';
import 'package:spending_tracker/widgets/home/buckets/add_bucket_button.dart';
import 'package:spending_tracker/widgets/home/buckets/bucket_item.dart';

class BucketsList extends StatefulWidget {
  const BucketsList({Key? key}) : super(key: key);

  @override
  _BucketsListState createState() => _BucketsListState();
}

class _BucketsListState extends State<BucketsList> {
  @override
  void initState() {
    super.initState();
    _loadBuckets();
  }

  _loadBuckets() async {
    Provider.of<BalanceModel>(context, listen: false).loadAllBuckets();
  }

  _onCreateBucket() {
    final balanceModel = Provider.of<BalanceModel>(context, listen: false);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return ListenableProvider.value(
            value: balanceModel,
            child: AddBucketForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.9;
    var height = 150.0;

    return Consumer<BalanceModel>(builder: (context, balanceModel, child) {
      List<Bucket> buckets = balanceModel.buckets;

      return Container(
        width: width,
        height: height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            AddBucketButton(onPressed: _onCreateBucket),
            ...buckets.map((e) => BucketItem(bucket: e)).toList()
          ],
        ),
      );
    });
  }
}
