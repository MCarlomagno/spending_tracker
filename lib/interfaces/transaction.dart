class Transaction {
  double amount;
  DateTime dateTime;
  String? detail;

  Transaction({required this.amount, required this.dateTime, this.detail});
}
