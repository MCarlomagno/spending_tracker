class Payment {
  int? id;
  double amount;
  DateTime date;
  String? detail;

  Payment({required this.amount, required this.date, this.id, this.detail});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "amount": this.amount,
        "date": this.date.toIso8601String(),
        "detail": this.detail,
      };

  factory Payment.fromMap(Map<String, dynamic> json) => new Payment(
        id: json["id"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        detail: json["detail"],
      );
}
