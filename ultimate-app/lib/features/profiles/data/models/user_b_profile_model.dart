import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';

class UserBProfileModel extends UserBProfile {
  UserBProfileModel({
    required String id,
    required String name,
    required String age,
    required String address,
    required String country,
    required String height,
    required String gender,
    required String about,
    required String ethnicity,
    required String nationality,
    required String reviewScore,
    required List<String> imageUrls,
    required List<String> interest,
  }) : super(
          id: id,
          name: name,
          age: age,
          about: about,
          gender: gender,
          height: height,
          address: address,
          country: country,
          ethnicity: ethnicity,
          imageUrls: imageUrls,
          interest: interest,
          nationality: nationality,
          reviewScore: reviewScore,
        );

  factory UserBProfileModel.fromJson(Map<String, dynamic> json) {
    return UserBProfileModel(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      address: json['address'],
      age: json['age'],
      country: json['country'],
      ethnicity: json['ethnicity'],
      gender: json['gender'],
      height: json['height'],
      imageUrls: json['imageUrls'],
      interest: json['interest'],
      nationality: json['natinality'],
      reviewScore: json['reviewScore'],
    );
  }
}
