class UserDbModel {
  int? id;
  String name;
  String email;
  String dob;
  String username;

  UserDbModel(
      {this.id,
      required this.name,
      required this.email,
      required this.dob,
      required this.username});

  UserDbModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        email = res["email"],
        dob = res["dob"],
        username = res["username"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "dob": dob,
      "username": username,
    };
  }
}
