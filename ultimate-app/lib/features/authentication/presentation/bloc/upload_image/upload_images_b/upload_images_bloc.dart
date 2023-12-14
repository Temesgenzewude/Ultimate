import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/features/authentication/data/repositories/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_images_event.dart';
part 'upload_images_state.dart';

class UserBUploadImagesBloc
    extends Bloc<UserBUploadImagesEvent, UserBUploadImagesState> {
  UserBUploadImagesBloc({
    required this.authenticationRepository,
  }) : super(UserBUploadImagesInitialState()) {
    on<UserBUploadImagesEvent>(_userBUploadImages);
  }
  final AuthenticationRepository authenticationRepository;

  UserBUploadImagesState userBUploadImagesSuccessOrFailure({dynamic result}) {
    if (result.runtimeType == List<String>) {
      return UserBUploadImagesSuccessState(images: result);
    } else {
      return UserBUploadImagesFailureState(errorMessage: result);
    }
  }

  Future<void> _userBUploadImages(UserBUploadImagesEvent event,
      Emitter<UserBUploadImagesState> emit) async {
    emit(UserBUploadImagesLoadingState());
    try {
      final result = await authenticationRepository.uploadImagesB(event.images);
      emit(userBUploadImagesSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(
        userBUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        userBUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ForbiddenResponseException catch (e) {
      emit(
        userBUploadImagesSuccessOrFailure(result: e.message),
      );
    } on ServerException catch (e) {
      emit(
        userBUploadImagesSuccessOrFailure(result: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        userBUploadImagesSuccessOrFailure(result: e.message),
      );
    }
  }
}
