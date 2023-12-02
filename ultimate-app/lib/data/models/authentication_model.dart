// ignore_for_file: sort_constructors_first

class UserAModel {
  String name; // User's name
  String password; // User's password
  String email; // User's email
  String phoneNumber; // User's phone number
  String birthDate; // User's birth date
  String address; // User's address
  String coordinates; // User's coordinates
  String? user_type; // User's type (optional)
  bool terms; // User's acceptance of terms

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
  String name; // User's name
  String password; // User's password
  String email; // User's email
  String? age; // User's age (optional)
  String? gender; // User's gender (optional)
  String phoneNumber; // User's phone number
  String birthDate; // User's birth date
  String location; // User's location
  String? about; // User's description (optional)
  bool terms; // User's acceptance of terms

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
  String? message; // Response message
  String? userId; // User ID

  SingUpResponseModel({
    this.message,
    this.userId,
  });

  SingUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    userId = json['id'];
  }
}

class UserBSingUpResponse {
  String? name; // User's name

  String? email; // User's email
  String? userId; // User ID

  String? phoneNumber; // User's phone number

  UserBSingUpResponse({
    this.name,
    this.email,
    this.userId,
    this.phoneNumber,
  });

  UserBSingUpResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    email = json['email'];

    phoneNumber = json['phoneNumber'];

    userId = json['_id'];
  }
}
