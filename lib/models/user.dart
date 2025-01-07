/// Model class for User
class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }
}
