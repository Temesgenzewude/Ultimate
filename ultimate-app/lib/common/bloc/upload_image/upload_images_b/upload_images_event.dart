part of 'upload_images_bloc.dart';

abstract class UploadImagesEventB {
  const UploadImagesEventB();
}

class UserBUploadImagesEvent extends UploadImagesEventB {
  UserBUploadImagesEvent({required this.images});
  final List<XFile> images;
}
