import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/buckets_model.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/utils/utils.dart';
import 'package:spending_tracker/widgets/home/add_bucket_form.dart';

import '../../setup.dart';

class BucketsList extends StatefulWidget {
  const BucketsList({Key? key}) : super(key: key);

  @override
  _BucketsListState createState() => _BucketsListState();
}

class _BucketsListState extends State<BucketsList> {
  final _bucketsService = getIt.get<BucketsService>();

  @override
  void initState() {
    super.initState();
    _loadBuckets();
  }

  _loadBuckets() async {
    Provider.of<BucketsModel>(context, listen: false).loadAll();
  }

  _onCreateBucket() {
    final bucketsModel = Provider.of<BucketsModel>(context, listen: false);
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return ListenableProvider.value(
            value: bucketsModel,
            child: AddBucketForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.9;
    var itemWidth = MediaQuery.of(context).size.width / 4;
    var height = 150.0;

    return Consumer<BucketsModel>(builder: (context, paymentsModel, child) {
      List<Bucket> buckets = paymentsModel.buckets;

      return Container(
        width: width,
        height: height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconButton(
              icon: Icon(Icons.add_circle_outline_outlined),
              onPressed: _onCreateBucket,
              iconSize: 30,
            ),
            ...buckets
                .map((e) => Container(
                      height: height,
                      width: itemWidth,
                      child: Column(
                        children: [
                          e.name != null ? Text(e.name!) : Text('Unnamed'),
                          Text(Utils.amountFormatString(e.amount))
                        ],
                      ),
                    ))
                .toList()
          ],
        ),
      );
    });
  }
}
