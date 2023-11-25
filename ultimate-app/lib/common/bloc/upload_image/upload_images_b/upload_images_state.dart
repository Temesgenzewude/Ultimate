part of 'upload_images_bloc.dart';

abstract class UserBUploadImagesState {
  const UserBUploadImagesState();
}

class UserBUploadImagesInitialState extends UserBUploadImagesState {}

class UserBUploadImagesLoadingState extends UserBUploadImagesState {}

class UserBUploadImagesSuccessState extends UserBUploadImagesState {
  const UserBUploadImagesSuccessState({required this.images});
  final List<String> images;
}

class UserBUploadImagesFailureState extends UserBUploadImagesState {
  const UserBUploadImagesFailureState({required this.errorMessage});
  final String errorMessage;
}
