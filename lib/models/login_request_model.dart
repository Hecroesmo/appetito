class LoginRequestModel {
  late String username;
  late String password;

  LoginRequestModel(
      this.username,
      this.password
      );

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }

}