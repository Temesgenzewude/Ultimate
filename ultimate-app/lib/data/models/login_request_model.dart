class LoginRequestModel {
  LoginRequestModel({
    required this.email,
    required this.password,
    this.phoneNumber,
  });
  String email;
  String password;
  String? phoneNumber;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
      };
}
