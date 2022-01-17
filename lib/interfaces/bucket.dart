class Bucket {
  String? id;
  String uid;
  double amount;
  String currency;
  String? name;

  Bucket(
      {required this.amount,
      required this.currency,
      required this.uid,
      this.id,
      this.name});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "amount": this.amount,
        "name": this.name,
        "currency": this.currency,
        "uid": this.uid,
      };

  factory Bucket.fromMap(Map<String, dynamic> json, String id) => new Bucket(
        id: id,
        amount: json["amount"],
        name: json["name"],
        currency: json["currency"],
        uid: json['uid'],
      );

  String toString() =>
      '(id=${this.id}, amount = ${this.amount}, name=${this.name}, currency=${this.currency}, uid=${this.uid})';
}
