class Bucket {
  int? id;
  double amount;
  String? name;

  Bucket({required this.amount, this.id, this.name});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "amount": this.amount,
        "name": this.name,
      };

  factory Bucket.fromMap(Map<String, dynamic> json) => new Bucket(
        id: json["id"],
        amount: json["amount"],
        name: json["name"],
      );

  String toString() => '(amount = ${this.amount}, name=${this.name})';
}
