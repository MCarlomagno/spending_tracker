import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/constants/dimensions.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/models/balance_model.dart';
import 'package:spending_tracker/widgets/shared/subtitle.dart';

class BucketDetail extends StatelessWidget {
  const BucketDetail({Key? key, required this.bucket}) : super(key: key);
  final Bucket bucket;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String detail = bucket.name.toString();
    String amount = bucket.amount.toStringAsFixed(2);

    if (detail.length == 0) {
      detail = 'No name provided';
    }

    double maxWidth = 400.0;
    bool isMobile = width < Dimensions.m;

    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: width,
          constraints: isMobile ? null : BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Subtitle(
                    text: "Bucket detail",
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                detail,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bucket.currency,
                        style: TextStyle(color: Colors.grey[600], fontSize: 20)),
                    TextSpan(
                        text: amount,
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 40)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: width,
                height: 50,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).errorColor),
                  ),
                  onPressed: () async {
                    await Provider.of<BalanceModel>(context, listen: false)
                        .deleteBucketById(bucket.id!);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
