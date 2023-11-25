class SaveUserInterestRequest {
  SaveUserInterestRequest({this.userIntrests});

  SaveUserInterestRequest.fromJson(Map<String, dynamic> json) {
    userIntrests = json['userIntrests'];
  }
  String? userIntrests;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userIntrests'] = userIntrests;
    return data;
  }
}
