import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/services/transactions_service.dart';

import '../setup.dart';

class PaymentModel extends ChangeNotifier {
  List<Payment> _payments = [];
  bool _loadingPayments = false;

  UnmodifiableListView<Payment> get payments => UnmodifiableListView(_payments);
  double get balance =>
      _payments.fold(0.0, (value, element) => value + element.amount);
  bool get loadingPayments => _loadingPayments;

  final _paymentsService = getIt.get<PaymentsService>();

  void add(Payment payment) {
    _payments.add(payment);
    notifyListeners();
  }

  setLoadingPayments(bool loading) {
    _loadingPayments = loading;
  }

  Future<void> loadAll() async {
    setLoadingPayments(true);
    this._payments = await _paymentsService.getAll();
    setLoadingPayments(false);
    notifyListeners();
  }

  Future<void> deleteById(int id) async {
    setLoadingPayments(true);
    await this._paymentsService.deleteById(id);
    await this.loadAll();
    setLoadingPayments(false);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    setLoadingPayments(true);
    await this._paymentsService.deleteAll();
    await this.loadAll();
    setLoadingPayments(false);
    notifyListeners();
  }
}
