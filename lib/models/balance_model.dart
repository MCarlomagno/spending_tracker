import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/setup.dart';

class BalanceModel extends ChangeNotifier {
  final _bucketsService = getIt.get<BucketsService>();
  final _paymentsService = getIt.get<PaymentsService>();

  List<Bucket> _buckets = [];
  List<Payment> _payments = [];

  bool _loadingBuckets = false;
  UnmodifiableListView<Bucket> get buckets => UnmodifiableListView(_buckets);
  bool get loadingBuckets => _loadingBuckets;

  bool _loadingPayments = false;
  UnmodifiableListView<Payment> get payments => UnmodifiableListView(_payments);
  bool get loadingPayments => _loadingPayments;

  double get balance => bucketsAmount + paymentsAmount;

  double get paymentsAmount => _payments.fold(0.0, (value, element) => value + element.amount);
  double get bucketsAmount => _buckets.fold(0.0, (value, element) => value + element.amount);

  void addBucket(Bucket bucket) {
    _buckets.add(bucket);
    notifyListeners();
  }

  setLoadingBuckets(bool loading) {
    _loadingBuckets = loading;
  }

  Future<void> loadAllBuckets() async {
    setLoadingBuckets(true);
    this._buckets = await _bucketsService.getAll();
    setLoadingBuckets(false);
    notifyListeners();
  }

  Future<void> deleteBucketById(int id) async {
    setLoadingBuckets(true);
    await this._bucketsService.deleteById(id);
    await this.loadAllBuckets();
    setLoadingBuckets(false);
    notifyListeners();
  }

  setLoadingPayments(bool loading) {
    _loadingPayments = loading;
  }

  void addPayment(Payment payment) {
    _payments.add(payment);
    notifyListeners();
  }

  Future<void> loadAllPayments() async {
    setLoadingPayments(true);
    this._payments = await _paymentsService.getAll();
    setLoadingPayments(false);
    notifyListeners();
  }

  Future<void> deletePaymentById(int id) async {
    setLoadingPayments(true);
    await this._paymentsService.deleteById(id);
    await this.loadAllPayments();
    setLoadingPayments(false);
    notifyListeners();
  }

  Future<void> deleteAllPayments() async {
    setLoadingPayments(true);
    await this._paymentsService.deleteAll();
    await this.loadAllPayments();
    setLoadingPayments(false);
    notifyListeners();
  }
}
