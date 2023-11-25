class SaveUserInterestsResponseModel {
  SaveUserInterestsResponseModel({required this.message});

  factory SaveUserInterestsResponseModel.fromJson(Map<String, dynamic> json) {
    return SaveUserInterestsResponseModel(
      message: json['message'] != null ? json['message'] : '',
    );
  }
  final String message;
}
