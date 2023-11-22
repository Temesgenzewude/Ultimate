class UserALoginRequestModel {
  UserALoginRequestModel({
    this.email,
    required this.password,
  });
  String? email;
  String password;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'password': password,
      };
}

class UserBLoginRequestModel {
  UserBLoginRequestModel({
    required this.phoneNumber,
    required this.password,
  });
  String phoneNumber;
  String password;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
