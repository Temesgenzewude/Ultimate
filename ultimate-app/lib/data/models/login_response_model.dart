// LoginResponseModel class represents the response model for login API.
class LoginResponseModel {
  LoginResponseModel({this.message, this.token, this.user});

  // Constructs a LoginResponseModel object from a JSON map.
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? message; // The message received from the API response.
  String? token; // The token received from the API response.
  User? user; // The user object received from the API response.
}

// User class represents the user model.
class User {
  User({this.userId, this.name, this.email, this.phoneNumber, this.isVerified});

  // Constructs a User object from a JSON map.
  User.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isVerified = json['isVerified'];
  }

  String? userId; // The unique identifier of the user.
  String? name; // The name of the user.
  String? email; // The email of the user.
  String? phoneNumber; // The phone number of the user.
  bool? isVerified; // Indicates whether the user is verified or not.

  // Converts the User object to a JSON map.
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
