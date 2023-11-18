class LoginResponseModel {
  LoginResponseModel({this.message, this.token, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  User? user;
}

class User {
  User({this.userId, this.name, this.email, this.phoneNumber, this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
  }
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  bool? isVerified;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['isVerified'] = isVerified;
    return data;
  }
}
