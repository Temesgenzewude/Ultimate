// ignore_for_file: sort_constructors_first

class UserAModel {
  String name;
  String password;
  String email;
  String phoneNumber;
  String birthDate;
  String address;
  String coordinates;
  String? user_type;
  bool terms;

  UserAModel({
    required this.name,
    required this.password,
    required this.email,
    required this.address,
    required this.birthDate,
    required this.coordinates,
    required this.phoneNumber,
    this.terms = true,
    this.user_type = 'user',
  });

  UserAModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        birthDate = json['birthDate'],
        address = json['address'],
        coordinates = json['coordinates'],
        user_type = json['user_type'],
        terms = json['terms'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
        'birthDate': birthDate,
        'address': address,
        'coordinates': coordinates,
        'user_type': user_type,
        'terms': terms,
      };
}

class UserBModel {
  String name;
  String password;
  String email;
  String? age;
  String? gender;
  String phoneNumber;
  String birthDate;
  String location;
  String? about;
  bool terms;

  UserBModel({
    required this.name,
    required this.password,
    required this.email,
     this.age,
    required this.birthDate,
    this.gender,
    required this.location,
    required this.phoneNumber,
     this.about,
    this.terms = true,
  });

  UserBModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        gender = json['gender'],
        birthDate = json['birthDate'],
        location = json['location'],
        about = json['about'],
        terms = json['terms'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
        'birthDate': birthDate,
        'location': location,
        'about': about,
        'terms': terms,
        'age': age,
        'gender': gender,
      };
}

class SingUpResponseModel {
  String? message;
  String? userId;

  SingUpResponseModel({
    this.message,
    this.userId,
  });

  SingUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    userId = json['id'];
  }
}
