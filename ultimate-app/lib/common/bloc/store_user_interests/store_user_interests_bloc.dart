import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/exception.dart';
import '../../../data/models/save_user_interests_request_model.dart';
import '../../../data/models/save_user_interests_response_model.dart';
import '../../../data/repositories/auth/auth_repo.dart';

part 'store_user_interests_event.dart';
part 'store_user_interests_state.dart';

class StoreUserInterestsBloc
    extends Bloc<StoreUserInterestsEvent, StoreUserInterestsState> {
  StoreUserInterestsBloc({required this.authenticationRepository})
      : super(StoreUserInterestsInitial()) {
    on<StoreUserInterestsEventCall>(_handleStoreUserInterestsEvent);
  }

  final AuthenticationRepository authenticationRepository;

  StoreUserInterestsState storeUserInterestsSuccessOrFailure({dynamic result}) {
    if (result is SaveUserInterestsResponseModel) {
      return StoreUserInterestsSuccessState(result: result);
    } else if (result is String) {
      return StoreUserInterestsFailureState(errorMessage: result);
    } else {
      return const StoreUserInterestsFailureState(
          errorMessage: 'Unexpected error');
    }
  }

  FutureOr<void> _handleStoreUserInterestsEvent(
      StoreUserInterestsEventCall event,
      Emitter<StoreUserInterestsState> emit) {
    emit(StoreUserInterestsLoadingState());

    try {
      final result = authenticationRepository
          .saveUserInterests(event.saveUserInterestRequest);

      emit(storeUserInterestsSuccessOrFailure(result: result));
    } on NoInternetException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    } on ServerException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    } on UnknownException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    }
  }
}
