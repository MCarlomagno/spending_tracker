import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/bucket.dart';
import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/services/bukets_service.dart';
import 'package:spending_tracker/services/transactions_service.dart';
import 'package:spending_tracker/setup.dart';

class BalanceModel extends ChangeNotifier {
  final _bucketsService = getIt.get<BucketsService>();
  final _transactionsService = getIt.get<TransactionsService>();

  List<Bucket> _buckets = [];
  List<Transaction> _transactions = [];

  bool _loadingBuckets = false;
  UnmodifiableListView<Bucket> get buckets => UnmodifiableListView(_buckets);
  bool get loadingBuckets => _loadingBuckets;

  bool _loadingTransactions = false;
  UnmodifiableListView<Transaction> get transactions => UnmodifiableListView(_transactions);
  bool get loadingTransactions => _loadingTransactions;

  List<String> currencies = ['\$', 'AR\$', '€'];

  Map<String, double> get balance {
    Map<String, double> balances = {};
    buckets.forEach((b) {
      if (balances.containsKey(b.currency)) {
        balances[b.currency] = balances[b.currency]! + b.amount;
      } else {
        balances.addAll({b.currency: b.amount});
      }
    });
    return balances;
  }

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

  Future<void> deleteBucketById(String id) async {
    setLoadingBuckets(true);
    await this._bucketsService.deleteById(id);
    await this.loadAllBuckets();
    setLoadingBuckets(false);
    notifyListeners();
  }

  setLoadingTransactions(bool loading) {
    _loadingTransactions = loading;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  Future<void> loadAllTransactions() async {
    setLoadingTransactions(true);
    _transactions = await _transactionsService.getAll();
    setLoadingTransactions(false);
    notifyListeners();
  }

  Future<void> deleteTransactionById(int id) async {
    setLoadingTransactions(true);
    await _transactionsService.deleteById(id);
    await loadAllTransactions();
    setLoadingTransactions(false);
    notifyListeners();
  }

  Future<void> deleteAllTransactions() async {
    setLoadingTransactions(true);
    await _transactionsService.deleteAll();
    await loadAllTransactions();
    setLoadingTransactions(false);
    notifyListeners();
  }
}
