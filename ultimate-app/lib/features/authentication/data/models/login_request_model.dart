class UserALoginRequestModel {
  UserALoginRequestModel({
    this.email,
    this.phoneNumber,
    required this.password,
  });
  String? email;
  String password;
  String? phoneNumber;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
      };
}

class UserBLoginRequestModel {
  UserBLoginRequestModel(
      {this.phoneNumber, required this.password, this.email});
  String? phoneNumber;
  String password;
  String? email;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
        'email': email
      };
}
