import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/constants/dimensions.dart';
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

  _onCreateBucket({required bool isMobile}) {
    final balanceModel = Provider.of<BalanceModel>(context, listen: false);

    Widget child = ListenableProvider.value(
      value: balanceModel,
      child: AddBucketForm(),
    );

    if (isMobile) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => child);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = 150.0;
    double maxWidth = 800.0;

    bool isMobile = width < Dimensions.m;

    return Consumer<BalanceModel>(builder: (context, balanceModel, child) {
      List<Bucket> buckets = balanceModel.buckets;

      return Container(
        width: width,
        height: height,
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            AddBucketButton(onPressed: () {
              _onCreateBucket(isMobile: isMobile);
            }),
            ...buckets.map((e) => BucketItem(bucket: e)).toList()
          ],
        ),
      );
    });
  }
}
