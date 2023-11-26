import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/exception.dart';
import '../../../data/models/account_info_model.dart';
import '../../../data/repositories/auth/auth_repo.dart';

part 'account_information_event.dart';
part 'account_information_state.dart';

class AccountInfoBloc extends Bloc<AccInfoEvent, AccInfoState> {
  AccountInfoBloc({
    required this.authenticationRepository,
  }) : super(AccInfoInitialState()) {
    on<AddAccInfoEvent>(_addAccInfo);
  }
  final AuthenticationRepository authenticationRepository;

  AccInfoState accInfoSuccessOrFailure(dynamic result) {
    if (result is AccInfoResponseModel) {
      return const AccInfoSuccessState();
    } else if (result is String) {
      return AccFailureState(errorMessage: result);
    } else {
      return const AccFailureState(errorMessage: 'Unexpected Error Occurred');
    }
  }

  Future<void> _addAccInfo(
      AddAccInfoEvent event, Emitter<AccInfoState> emit) async {
    emit(AccInfoLoadingState());
    try {
      final result =
          await authenticationRepository.addAccountInfo(event.accInfo);
      emit(accInfoSuccessOrFailure(result));
    } on NoInternetException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on ForbiddenResponseException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on ConnectionTimeOutException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    } on UnknownException catch (e) {
      emit(
        accInfoSuccessOrFailure(e.message),
      );
    }
  }
}
