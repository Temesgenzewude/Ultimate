class SaveUserInterestsResponseModel {
  SaveUserInterestsResponseModel({required this.message});

  factory SaveUserInterestsResponseModel.fromJson(Map<String, dynamic> json) {
    return SaveUserInterestsResponseModel(
      message: json['message'] ?? 'Successfully saved user interests',
    );
  }
  final String message;
}
