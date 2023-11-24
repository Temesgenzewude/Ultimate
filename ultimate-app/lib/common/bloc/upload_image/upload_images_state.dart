part of 'upload_images_bloc.dart';

abstract class UploadImagesState {
  const UploadImagesState();
}

class UploadImagesInitialState extends UploadImagesState {}

class UploadImagesLoadingState extends UploadImagesState {}

class UploadImagesSuccessState extends UploadImagesState {
  const UploadImagesSuccessState({required this.images});
  final List<String> images;
}

class UploadImagesFailureState extends UploadImagesState {
  const UploadImagesFailureState({required this.errorMessage});
  final String errorMessage;
}
