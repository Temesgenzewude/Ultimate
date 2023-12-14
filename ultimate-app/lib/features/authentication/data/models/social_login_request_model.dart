class SocialLoginRequestModel {
  SocialLoginRequestModel({
    required this.email,
    required this.name,
    required this.token,
  });

  factory SocialLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      SocialLoginRequestModel(
        email: json['email'] as String,
        name: json['name'] as String,
        token: json['token'] as String,
      );

  String email;
  String name;
  String token;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['token'] = token;

    return data;
  }
}
