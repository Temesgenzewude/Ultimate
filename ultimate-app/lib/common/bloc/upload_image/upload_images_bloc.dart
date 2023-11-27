import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/error/exception.dart';
import '../../../data/repositories/auth/auth_repo.dart';

part 'upload_images_event.dart';
part 'upload_images_state.dart';

class UploadImagesBloc extends Bloc<UploadImagesEvent, UploadImagesState> {
  UploadImagesBloc({
    required this.authenticationRepository,
  }) : super(UploadImagesInitialState()) {
    on<UserAUploadImagesEvent>(_userAUploadImages);
  }
  final AuthenticationRepository authenticationRepository;

  UploadImagesState userAUploadImagesSuccessOrFailure({dynamic result}) {
    if (result.runtimeType == List<String>) {
      return UploadImagesSuccessState(images: result);
    } else {
      return UploadImagesFailureState(errorMessage: result);
    }
  }

  Future<void> _userAUploadImages(
      UserAUploadImagesEvent event, Emitter<UploadImagesState> emit) async {
    emit(UploadImagesLoadingState());
    try {
      final result = await authenticationRepository.uploadImagesA(event.images);
      emit(userAUploadImagesSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(
        userAUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        userAUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ForbiddenResponseException catch (e) {
      emit(
        userAUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ServerException catch (e) {
      emit(
        userAUploadImagesSuccessOrFailure(result: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        userAUploadImagesSuccessOrFailure(result: e.message),
      );
    }
  }
}
