import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/payment.dart';

class PaymentModel extends ChangeNotifier {
  final List<Payment> _payments = [];
  UnmodifiableListView<Payment> get transactions =>
      UnmodifiableListView(_payments);

  double get balance =>
      _payments.fold(0.0, (value, element) => value + element.amount);

  void add(Payment payment) {
    _payments.add(payment);
    notifyListeners();
  }
}
