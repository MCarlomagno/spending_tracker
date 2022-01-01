class Bucket {
  int? id;
  double amount;
  String currency;
  String? name;

  Bucket({required this.amount, required this.currency, this.id, this.name});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "amount": this.amount,
        "name": this.name,
        "currency": this.currency,
      };

  factory Bucket.fromMap(Map<String, dynamic> json) => new Bucket(
        id: json["id"],
        amount: json["amount"],
        name: json["name"],
        currency: json["currency"],
      );

  String toString() =>
      '(amount = ${this.amount}, name=${this.name}, currency=${this.currency})';
}
