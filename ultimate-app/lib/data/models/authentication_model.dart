class UserSignUpRequestModel {

  UserSignUpRequestModel({
    required this.name,
    required this.password,
    required this.email,
    required this.coordinates,
    required this.phoneNumber,
    this.terms = true,
    this.user_role = 'A',
  });

  UserSignUpRequestModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        coordinates = json['coordinates'],
        user_role = json['user_role'],
        terms = json['terms'];
  String name;
  String password;
  String email;
  String phoneNumber;

  String coordinates;
  String user_role;
  bool terms;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
    
        'coordinates': coordinates,
        'user_role': user_role,
        'terms': terms,
      };
}

class UserAModel { // User's acceptance of terms

  UserAModel({
    required this.name,
    required this.password,
    required this.email,
    // required this.address,
    // required this.birthDate,
    required this.coordinates,
    required this.phoneNumber,
    this.terms = true,
    this.user_role = 'A',
  });

  UserAModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        // birthDate = json['birthDate'],
        // address = json['address'],
        coordinates = json['coordinates'],
        user_role = json['user_role'],
        terms = json['terms'];
  String name; // User's name
  String password; // User's password
  String email; // User's email
  String phoneNumber; // User's phone number
  // String birthDate; // User's birth date
  // String address; // User's address
  String coordinates; // User's coordinates
  String user_role; // User's type (optional)
  bool terms;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
        // 'birthDate': birthDate,
        // 'address': address,
        'coordinates': coordinates,
        'user_role': user_role,
        'terms': terms,
      };
}

class UserBModel {

  UserBModel({
    required this.name,
    required this.password,
    required this.email,
    // this.age,
    // required this.birthDate,
    // this.gender,

    required this.phoneNumber,
    required this.coordinates,
    // this.about,
    this.user_role = 'B',
    this.terms = true,
  });

  UserBModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        // age = json['age'],
        password = json['password'],
        email = json['email'],
        phoneNumber = json['phoneNumber'],
        // gender = json['gender'],
        // birthDate = json['birthDate'],
        coordinates = json['location'],
        // about = json['about'],
        terms = json['terms'],
        user_role = json['user_role'];
  String name; // User's name
  String password; // User's password
  String email; // User's email
  // String? age; // User's age (optional)
  // String? gender; // User's gender (optional)
  String phoneNumber; // User's phone number
  // String birthDate; // User's birth date

  // String? about; // User's description (optional)
  bool terms; // User's acceptance of terms
  String coordinates;
  String user_role;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'password': password,
        'email': email,
        'phoneNumber': phoneNumber,
        // 'birthDate': birthDate,
        'coordinates': coordinates,
        // 'about': about,
        'terms': terms,
        // 'age': age,
        // 'gender': gender,
        'user_role': user_role,
      };
}

class SingUpResponseModel { // User ID

  SingUpResponseModel({
    this.message,
    this.userId,
  });

  SingUpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    userId = json['id'];
  }
  String? message; // Response message
  String? userId;
}

class UserBSingUpResponse { // User's phone number

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
  String? name; // User's name

  String? email; // User's email
  String? userId; // User ID

  String? phoneNumber;
}
