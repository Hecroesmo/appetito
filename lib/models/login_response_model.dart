import 'dart:convert';

LoginResponseModel loginResponseModel(String str) => 
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  late String token;

  LoginResponseModel(this.token);

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['token'] = token;
    return _data;
  }
}