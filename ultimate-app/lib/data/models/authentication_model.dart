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
    print(json);
    final authmodel = AuthenticationModel(
        userName: (json['user'] != null) ? json['user']['name'] : 'mock name',
        password: json['token'] ?? 'mock token');
    return authmodel;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'id': userName,
//         'password': password,
//       };
// 
}
