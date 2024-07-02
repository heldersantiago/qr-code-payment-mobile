class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
