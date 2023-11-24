part of 'upload_images_bloc.dart';

abstract class UploadImagesEvent {
  const UploadImagesEvent();
}

class UserAUploadImagesEvent extends UploadImagesEvent {
  UserAUploadImagesEvent({required this.images});
  final List<XFile> images;
}

class UserBUploadImagesEvent extends UploadImagesEvent {
  UserBUploadImagesEvent({required this.images});
  final List<XFile> images;
}