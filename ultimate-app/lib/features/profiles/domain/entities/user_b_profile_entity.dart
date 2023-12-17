import 'package:equatable/equatable.dart';

class UserBProfile extends Equatable {
  const UserBProfile({
    required this.id,
    required this.name,
    required this.about,
    required this.age,
    required this.gender,
    required this.imageUrl,
    required this.reviewScore,
    required this.address,
    required this.country,
    required this.ethnicity,
    required this.height,
    required this.interest,
    required this.nationality,
    required this.accStatus,
    required this.birthDate,
    required this.bornReligious,
    required this.documentApprove,
    required this.email,
    required this.healthIssue,
    required this.idToken,
    required this.isDrink,
    required this.isMadication,
    required this.isSmoke,
    required this.isVerified,
    required this.levelOfReligiously,
    required this.lookingFor,
    required this.martialStatus,
    required this.phoneNumber,
    required this.postalCode,
    required this.profession,
    required this.resetToken,
    required this.sect,
    required this.terms,
    required this.userImages,
    required this.vip,
  }) : super();
  final String id;
  final String name;
  final String age;
  final String gender;
  final String about;
  final String reviewScore;
  final String imageUrl;
  final String address;
  final String postalCode;
  final bool isVerified;
  final String country;
  final String bornReligious;
  final String sect;
  final bool accStatus;
  final String ethnicity;
  final String height;
  final String profession;
  final String lookingFor;
  final String healthIssue;
  final String isDrink;
  final String isSmoke;
  final String isMadication;
  final String nationality;
  final String levelOfReligiously;
  final String documentApprove;
  final String email;
  final List<String> interest;
  final String vip;
  final bool terms;
  final String phoneNumber;
  final String birthDate;
  final String martialStatus;
  final String idToken;
  final String resetToken;
  final List<String> userImages;

  @override
  List<Object> get props => [id, name];
}
