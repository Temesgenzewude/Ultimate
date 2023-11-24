import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/login_request_model.dart';
import '../../../data/models/login_response_model.dart';

part 'upload_images_event.dart';
part 'upload_images_state.dart';

class UploadImagesBloc extends Bloc<UploadImagesEvent, UploadImagesState> {
  UploadImagesBloc({
    required this.authenticationRepository,
  }) : super(UploadImagesInitialState()) {
    on<UserAUploadImagesEvent>(_userAUploadImages);
    on<UserBUploadImagesEvent>(_userBUploadImages);
  }
  final AuthenticationRepository authenticationRepository;

  UploadImagesState UploadImagesSuccessOrFailure({dynamic result}) {
    if (result.runtimeType == List<String>) {
      return UploadImagesSuccessState(images: result);
    } else {
      return UploadImagesFailureState(errorMessage: result);
    }
  }

  void _userAUploadImages(
      UserAUploadImagesEvent event, Emitter<UploadImagesState> emit) async {
    emit(UploadImagesInitialState());
    try {
      final result = await authenticationRepository.uploadImagesA(event.images);
      emit(UploadImagesSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on ServerException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    }
  }

  void _userBUploadImages(
      UserBUploadImagesEvent event, Emitter<UploadImagesState> emit) async {
    emit(UploadImagesInitialState());
    try {
      final result = await authenticationRepository.uploadImagesB(event.images);
      emit(UploadImagesSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on ServerException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        UploadImagesSuccessOrFailure(result: e.message),
      );
    }
  }
}
