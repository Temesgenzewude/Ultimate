class UserAOrBSignUpRequestModel {
  UserAOrBSignUpRequestModel(
      {this.name,
      this.email,
      this.password,
      this.phoneNumber,
      this.birthDate,
      this.address,
      this.coordinates,
      this.userRole,
      this.terms,
      this.gender,
      this.age,
      this.about,
      this.maritalStatus,
      this.height,
      this.profession,
      this.lookingFor,
      this.child,
      this.sect,
      this.healthIssue,
      this.bornReligious,
      this.isDrink,
      this.isSmoke,
      this.isMadication,
      this.ethnicity,
      this.nationality,
      this.levelOfReligiously,
      this.postalCode,
      this.country});

  UserAOrBSignUpRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
    address = json['address'];
    coordinates = json['coordinates'];
    userRole = json['user_role'];
    terms = json['terms'];
    gender = json['gender'];
    age = json['age'];
    about = json['about'];
    maritalStatus = json['maritalStatus'];
    height = json['height'];
    profession = json['profession'];
    lookingFor = json['lookingFor'];
    child = json['child'];
    sect = json['sect'];
    healthIssue = json['healthIssue'];
    bornReligious = json['bornReligious'];
    isDrink = json['isDrink'];
    isSmoke = json['isSmoke'];
    isMadication = json['isMadication'];
    ethnicity = json['ethnicity'];
    nationality = json['nationality'];
    levelOfReligiously = json['levelOfReligiously'];
    postalCode = json['postalCode'];
    country = json['country'];
  }
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? birthDate;
  String? address;
  String? coordinates;
  String? userRole;
  String? terms;
  String? gender;
  String? age;
  String? about;
  String? maritalStatus;
  String? height;
  String? profession;
  String? lookingFor;
  String? child;
  String? sect;
  String? healthIssue;
  String? bornReligious;
  bool? isDrink;
  bool? isSmoke;
  bool? isMadication;
  String? ethnicity;
  String? nationality;
  String? levelOfReligiously;
  String? postalCode;
  String? country;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['birthDate'] = birthDate;
    data['address'] = address;
    data['coordinates'] = coordinates;
    data['user_role'] = userRole;
    data['terms'] = terms;
    data['gender'] = gender;
    data['age'] = age;
    data['about'] = about;
    data['maritalStatus'] = maritalStatus;
    data['height'] = height;
    data['profession'] = profession;
    data['lookingFor'] = lookingFor;
    data['child'] = child;
    data['sect'] = sect;
    data['healthIssue'] = healthIssue;
    data['bornReligious'] = bornReligious;
    data['isDrink'] = isDrink;
    data['isSmoke'] = isSmoke;
    data['isMadication'] = isMadication;
    data['ethnicity'] = ethnicity;
    data['nationality'] = nationality;
    data['levelOfReligiously'] = levelOfReligiously;
    data['postalCode'] = postalCode;
    data['country'] = country;
    return data;
  }
}
