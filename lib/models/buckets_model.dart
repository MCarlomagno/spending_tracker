import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/services/bukets_service.dart';

import '../setup.dart';

class BucketsModel extends ChangeNotifier {
  List<Bucket> _buckets = [];
  bool _loadingBuckets = false;

  UnmodifiableListView<Bucket> get buckets => UnmodifiableListView(_buckets);
  bool get loadingBuckets => _loadingBuckets;

  final _bucketsService = getIt.get<BucketsService>();

  void add(Bucket bucket) {
    _buckets.add(bucket);
    notifyListeners();
  }

  setLoading(bool loading) {
    _loadingBuckets = loading;
  }

  Future<void> loadAll() async {
    setLoading(true);
    this._buckets = await _bucketsService.getAll();
    setLoading(false);
    notifyListeners();
  }
}
