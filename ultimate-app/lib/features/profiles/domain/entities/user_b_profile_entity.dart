import 'package:equatable/equatable.dart';

class UserBProfile extends Equatable {
  const UserBProfile({
    required this.id,
    required this.name,
    required this.about,
    required this.age,
    required this.gender,
    required this.imageUrls,
    required this.reviewScore,
    required this.address,
    required this.country,
    required this.ethnicity,
    required this.height,
    required this.interest,
    required this.nationality,
  }) : super();
  final String id;
  final String name;
  final String age;
  final String gender;
  final List<String> imageUrls;
  final String address;
  final String country;
  final String ethnicity;
  final String height;
  final String nationality;
  final List<String> interest;
  final String about;
  final String reviewScore;

  @override
  List<Object> get props => [id, name];
}
