// ignore_for_file: sort_constructors_first

class AccountInfoModel {
  String? userId = '';
  String? gender;
  String? age;
  String? profession;
  String? about = 'I am test';
  String? address = 'US';
  String? maritalStatus = 'Single';
  String? height = '188cm';
  String? lookingFor = 'Friend';
  String? child = '2';
  String? sect = 'Sunni';
  String? healthIssue = 'No';
  String? bornReligious = 'Born Muslim';
  bool? isDrink = false;
  bool? isSmoke = false;
  bool? isMadication = false;
  String? ethnicity = 'Turkish';
  String? nationality = 'turkish';
  String? levelOfReligiously = 'Conservative';

  AccountInfoModel({
    this.about,
    this.age,
    this.bornReligious,
    this.address,
    this.child,
    this.ethnicity,
    this.gender,
    this.lookingFor,
    this.healthIssue,
    this.height,
    this.isDrink,
    this.isMadication,
    this.isSmoke,
    this.levelOfReligiously,
    this.maritalStatus,
    this.nationality,
    this.profession,
    this.sect,
    this.userId,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'gender': gender,
        'age': age,
        'about': about,
        'address': address,
        'maritalStatus': maritalStatus,
        'height': height,
        'profession': profession,
        'lookingFor': lookingFor,
        'child': child,
        'sect': sect,
        'healthIssue': healthIssue,
        'bornReligious': bornReligious,
        'isDrink': isDrink,
        'isSmoke': isSmoke,
        'isMadication': isMadication,
        'ethnicity': ethnicity,
        'nationality': nationality,
        'levelOfReligiously': levelOfReligiously,
      };
}

class AccInfoResponseModel {
  String? message;

  AccInfoResponseModel({
    this.message,
  });

  AccInfoResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
  }
}
