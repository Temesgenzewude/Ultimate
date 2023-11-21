class SocialLoginResponseModel {
  SocialLoginResponseModel({this.token, this.message, this.status});

  SocialLoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    status = json['status'];
  }

  String? token;
  String? message;
  String? status;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
