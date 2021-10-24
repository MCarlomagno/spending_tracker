class User {
  int? id;
  String? name;

  User({this.id, this.name});

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "name": this.name,
      };

  factory User.fromMap(Map<String, dynamic> json) => new User(
        id: json["id"],
        name: json["name"],
      );

  String toString() => '(name = ${this.name})';
}
