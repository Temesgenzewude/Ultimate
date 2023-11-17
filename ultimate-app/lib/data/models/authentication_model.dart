class AuthenticationModel {
  String userName;
  String password;

  AuthenticationModel({required this.userName, required this.password});

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      userName: json['userName'],
      password: json['password'],
    );
  }

}
