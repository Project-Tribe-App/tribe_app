class LoginModel {
  String? identifier;
  String? password;

  LoginModel({this.identifier, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['password'] = password;
    return data;
  }
}
