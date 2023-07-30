class LoginRequestModel {
  late String email;
  late String password;

  LoginRequestModel(
      this.email,
      this.password
      );

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }

}