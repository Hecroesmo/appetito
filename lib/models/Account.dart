class Account {
  final int id;
  final String email;
  final String password;
  final String role;

  Account({
    required this.id,
    required this.email,
    required this.password,
    required this.role
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'role': role,
  };

}