// ignore_for_file: sort_constructors_first

class AuthenticationModel {
  String userName;
  String password;
  String? email;
  String? phoneNumber;
  String? birthday;
  String? address;
  String? coordinates;
  String? userType;
  String? terms;

  AuthenticationModel({
    required this.userName,
    required this.password,
    this.email,
    this.address,
    this.birthday,
    this.coordinates,
    this.phoneNumber,
    this.terms,
    this.userType,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      userName: json['userName'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': userName,
        'password': password,
      };
}
