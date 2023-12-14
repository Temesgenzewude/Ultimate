import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ultimate/core/error/exception.dart';
import 'package:flutter_ultimate/features/authentication/data/models/save_user_interests_request_model.dart';
import 'package:flutter_ultimate/features/authentication/data/models/save_user_interests_response_model.dart';
import 'package:flutter_ultimate/features/authentication/data/repositories/auth_repo.dart';

part 'store_user_interests_event.dart';
part 'store_user_interests_state.dart';

/// The BLoC responsible for handling user interests storage.
class StoreUserInterestsBloc
    extends Bloc<StoreUserInterestsEvent, StoreUserInterestsState> {
  StoreUserInterestsBloc({required this.authenticationRepository})
      : super(StoreUserInterestsInitial()) {
    on<StoreUserInterestsEventCall>(_handleStoreUserInterestsEvent);
  }

  final AuthenticationRepository authenticationRepository;

  /// Determines the success or failure state based on the result.
  StoreUserInterestsState storeUserInterestsSuccessOrFailure({dynamic result}) {
    if (result is SaveUserInterestsResponseModel) {
      return StoreUserInterestsSuccessState(result: result);
    } else if (result is String) {
      return StoreUserInterestsFailureState(errorMessage: result);
    } else {
      return const StoreUserInterestsFailureState(
          errorMessage: 'Something went wrong. Please try again later.');
    }
  }

  /// Handles the store user interests event.
  FutureOr<void> _handleStoreUserInterestsEvent(
      StoreUserInterestsEventCall event,
      Emitter<StoreUserInterestsState> emit) async {
    emit(StoreUserInterestsLoadingState());

    try {
      final result = await authenticationRepository
          .saveUserInterests(event.saveUserInterestRequest);

      emit(storeUserInterestsSuccessOrFailure(result: result));
    } on ServerException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    } on NoInternetException catch (e) {
      emit(
        storeUserInterestsSuccessOrFailure(result: e.message),
      );
    } on ConnectionTimeOutException catch (e) {
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
