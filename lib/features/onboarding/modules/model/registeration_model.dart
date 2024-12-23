class RegistrationModel {
  String? name;
  String? username;
  String? email;
  String? password;
  int? phoneNumber;
  String? city;
  String? state;
  String? country;

  RegistrationModel(
      {this.name, this.username, this.email, this.password, this.phoneNumber, this.city, this.state, this.country});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    return data;
  }
}
