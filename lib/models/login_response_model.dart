import 'dart:convert';

LoginResponseModel loginResponseModel(String str) => 
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  late String token;

  LoginResponseModel({
    required this.token
});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['token'] = token;
    return _data;
  }
}