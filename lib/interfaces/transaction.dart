class Transaction {
  String? id;
  String uid;
  double amount;
  DateTime date;
  String? detail;

  Transaction(
      {required this.uid,
      required this.amount,
      required this.date,
      this.id,
      this.detail});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "uid": this.uid,
        "amount": this.amount,
        "date": this.date.toIso8601String(),
        "detail": this.detail,
      };

  factory Transaction.fromMap(Map<String, dynamic> json, String id) =>
      new Transaction(
        id: id,
        uid: json["uid"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        detail: json["detail"],
      );

  String toString() =>
      '(id= ${this.id}, uid= ${this.uid}, amount = ${this.amount}, date=${this.date}, detail=${this.detail})';
}
